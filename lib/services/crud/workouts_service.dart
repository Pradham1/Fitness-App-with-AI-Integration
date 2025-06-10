import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;


class DatabaseAlreadyOpenException implements Exception {}
class UnableToGetDocumentsDirectoryException implements Exception {}
class DatabaseIsNotOpenException implements Exception {
  final String message;
  DatabaseIsNotOpenException([this.message = 'The database is not open.']);
}
class CouldNotDeleteUserException implements Exception {
  final String message;
  CouldNotDeleteUserException([this.message = 'Could not delete user.']);
}
class UserAlreadyExistsException implements Exception {
  final String message;
  UserAlreadyExistsException([this.message = 'User already exists.']);
}
class CouldNotFindUserException implements Exception {
  final String message;
  CouldNotFindUserException([this.message = 'Could not find user.']);
}
class CouldNotDeleteNoteException implements Exception {
  final String message;
  CouldNotDeleteNoteException([this.message = 'Could not delete note.']);
}
class CouldNotFindNoteException implements Exception {
  final String message;
  CouldNotFindNoteException([this.message = 'Could not find note.']);
}
class CouldNotUpdateNoteException implements Exception {
  final String message;
  CouldNotUpdateNoteException([this.message = 'Could not update note.']);
}

class WorkoutsService {
  Database? _db;

  List<DatabaseNote> _notes = [];

  final _notesStreamController = StreamController<List<DatabaseNote>>.broadcast();

  Future<void> ensureDbIsOpen() async {
    if (_db != null) {
      return;
    }
    try {
      await open();
    } on DatabaseAlreadyOpenException {
      // Do nothing, the database is already open
    }
  }

  Future<DatabaseUser> getOrCreateUser({required String email}) async {
    try {
      final user = await getUser(email: email);
      return user;
    } on CouldNotFindUserException {
      final createdUser = await createUser(email: email);
      return createdUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _cacheNotes() async {
    final allNotes = await getAllNotes();
    _notes = allNotes.toList();
    _notesStreamController.add(_notes);
  }

  Future<DatabaseNote> updateNote({required DatabaseNote note, required String text}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();

    await getNote(id: note.id);

    final updatesCount = await db.update(noteTable, {
      textColumn: text,
    });

    if(updatesCount == 0) {
      throw CouldNotUpdateNoteException('Could not update note with id: ${note.id}');
    } else {
      final updatedNote = await getNote(id: note.id);
      _notes.removeWhere((notes) => note.id == updatedNote.id);
      _notes.add(updatedNote);
      _notesStreamController.add(_notes);
      return updatedNote;
    }
    
  }

  Future<Iterable<DatabaseNote>> getAllNotes() async {

    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final notes = await db.query(noteTable);

    return notes.map((noteRow) => DatabaseNote.fromRow(noteRow));

    
  }

  Future<DatabaseNote> getNote({required int id}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final notes = await db.query(noteTable, limit: 1, where: 'id = ?', whereArgs: [id]);

    if (notes.isEmpty) {
      throw CouldNotFindNoteException('Could not find note with id: $id');
    } else {
      final note = DatabaseNote.fromRow(notes.first);
      _notes.removeWhere((note) => note.id == id);
      _notes.add(note);
      _notesStreamController.add(_notes);
      return note;
    }
  }

  Future<int> deleteAllNotes() async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final numberOfDeletions = await db.delete(noteTable);
    _notes = [];
    _notesStreamController.add(_notes);
    return numberOfDeletions;

  }

  Future<void> deleteNote({required int id}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(userTable, where: 'email = ?', whereArgs: [id]);
    if (deletedCount == 0) {
      throw CouldNotDeleteNoteException('Could not delete note with id: $id');
    } else {
      _notes.removeWhere((note) => note.id == id);
      _notesStreamController.add(_notes);
    }
  }

  Future<DatabaseNote> createNote({required DatabaseUser owner}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
     final dbUser = await getUser(email: owner.email);
     if(dbUser.id != owner.id) {
       throw CouldNotFindUserException('User with email ${owner.email} not found');
     }

     const text = '';

     final noteId = await db.insert(noteTable, {
       userIdColumn: dbUser.id,
       textColumn: text,
     });

     final note = DatabaseNote(
       id: noteId,
       userId: owner.id,
       text: text,
     );

     _notes.add(note);
      _notesStreamController.add(_notes);

     return note;
  }

  Future<DatabaseUser> getUser({required String email}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(userTable, limit: 1, where: 'email = ?', whereArgs: [email.toLowerCase()]);
    if (results.isEmpty) {
      throw CouldNotFindUserException('User with email $email not found');
    } else {
      return DatabaseUser.fromRow(results.first);
    }
  }

  Future<DatabaseUser> createUser({required String email}) async {
    await ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(userTable, limit:1, where: 'email = ?', whereArgs: [email.toLowerCase()]);
    if (results.isNotEmpty) {
      throw UserAlreadyExistsException('User with email $email already exists');
    }

    final userId = await db.insert (userTable, {
      emailColumn: email.toLowerCase(),
    });

    return DatabaseUser(
      id: userId,
      email: email.toLowerCase(),
    );
  }

  Future<void> deleteUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(userTable, where: 'email = ?',whereArgs: [email.toLowerCase()]);
    if (deletedCount != 1) {
      throw CouldNotDeleteUserException('Could not delete user with email: $email');
    }
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      return db;
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpenException();
    } 
    else {
    await db.close();
    _db = null;
    }
  }

  Future<void> open() async {
    if (_db != null) {
      throw Exception('Database is already open');
    }
    try{
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db  = await openDatabase(dbPath);
      _db = db;

      const createUserTable = '''CREATE TABLE IF NOT EXISTS "user"  (
        "id" INTERGER NOT NULL,
        "email" TEXT NOT NULL UNIQUE,
        PRIMARY KEY("id" AUTOINCREMENT)
      );''';

      await db.execute(createUserTable);

      const createNoteTable = '''CREATE TABLE IF NOT EXISTS "note" (
        "id" INTEGER NOT NULL,
        "user_id" INTEGER NOT NULL,
        "text" TEXT,
        PRIMARY KEY("id" AUTOINCREMENT),
        FOREIGN KEY("user_id") REFERENCES "user"("id")
      );''';

      await _cacheNotes();
      await db.execute(createNoteTable);
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectoryException();
    }
  }
}

@immutable
class DatabaseUser {
  final int id;
  final String email;
  const DatabaseUser({
    required this.id,
    required this.email,
  });


DatabaseUser.fromRow(Map<String, Object?> map) 
  : id = map[idColumn] as int,
    email = map[""] as String;

  @override
  String toString() => 'Person, ID = $id, email = $email';

  @override
  bool operator ==(covariant DatabaseUser other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class DatabaseNote {
  final int id;
  final int userId;
  final String text;
  const DatabaseNote({
    required this.id,
    required this.userId,
    required this.text,
  });

  DatabaseNote.fromRow(Map<String, Object?> map) 
    : id = map[idColumn] as int,
      userId = map[userIdColumn] as int,
      text = map[textColumn] as String;

  @override
  String toString() => 'Note, ID = $id, userId = $userId, text = $text';

  @override
  bool operator ==(covariant DatabaseNote other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const String userTable = 'user';
const String noteTable = 'note';
const String dbName = "workout.db";
const idColumn = "id";
const emailColumn = "email";
const userIdColumn = "user_id";
const textColumn = "text";