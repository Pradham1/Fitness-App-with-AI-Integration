import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_app/cloud/cloud_plan.dart';
import 'package:workout_app/cloud/cloud_storage_constants.dart';
import 'package:workout_app/services/crud/workouts_service.dart';

class FirebaseCloudStorage {

  final notes = FirebaseFirestore.instance.collection('notes');

  Future<void> deleteNote({required String documentId}) async {
    try {
      await notes.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteNoteException();
    }
  }



  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId}) {
    final allNotes = notes
      .where(ownerUserIdFieldName, isEqualTo: ownerUserId)
      .snapshots()
      .map((event) => event.docs
        .map((doc) => CloudNote.fromSnapshot(doc)));
    return allNotes;    
  }

  Future<CloudNote> createNewNote({required String ownerUserId, required String apiText}) async {
    final document = await notes.add({
      ownerUserIdFieldName: ownerUserId,
      textFieldName: apiText,
    });
    final fetchedNote = await document.get();
    return CloudNote(
      documentId: fetchedNote.id,
      ownerUserId: ownerUserId,
      text: apiText,
      );
  }

  static final FirebaseCloudStorage _shared = FirebaseCloudStorage._sharedInstance();
  FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;
}