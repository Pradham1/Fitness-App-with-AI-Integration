import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:workout_app/cloud/cloud_storage_constants.dart';

@immutable
class CloudPlan {
  final String documentId;
  final String ownerUserId;
  final String text;

  CloudPlan({
    required this.documentId, 
    required this.ownerUserId, 
    required this.text
  });


CloudPlan.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) :
  documentId = snapshot.id,
  ownerUserId = snapshot.data()[textFieldName],
  text = snapshot.data()[textFieldName];

}  