import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:workout_app/cloud/cloud_storage_constants.dart';

@immutable
class CloudNote {
  final String documentId;  
  final String ownerUserId;
  final String text;
  const CloudNote({
    required this.documentId,
    required this.ownerUserId,
    required this.text,
  });


  CloudNote.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) :
    documentId = snapshot.id,
    ownerUserId = snapshot.data()[ownerUserIdFieldName],
    text = snapshot.data()[textFieldName] as String;
}    