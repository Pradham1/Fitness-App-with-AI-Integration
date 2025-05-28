import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_app/cloud/cloud_plan.dart';
import 'package:workout_app/cloud/cloud_storage_constants.dart';

class CloudStorage {
  static final CloudStorage _shared = 
    CloudStorage._sharedInstance();
    CloudStorage._sharedInstance();
    factory CloudStorage() => _shared;

    final plans = FirebaseFirestore.instance.collection('plans');

    void createNewPlan({required String ownerUserId}) async {
      plans.add({
        ownerUserIdFieldName: ownerUserId,
        textFieldName: '',
      });
    }

    Stream<Iterable<CloudPlan>> allPlans({required String ownerUserId}) => 
      plans.snapshots().map((event) => event.docs
      .map((doc) => CloudPlan.fromSnapshot(doc))
      .where((plan) => plan.ownerUserId == ownerUserId));

    Future<void> deletePlan({required String documentId}) async {
      try {
        await plans.doc(documentId).delete();
      } catch (e) {
        throw Exception(e);
      }
    }  

    Future<Iterable<CloudPlan>> getPlans({required String ownerUserId}) async {
      try {
        return await plans.where(
          ownerUserIdFieldName,
          isEqualTo: ownerUserId
        ).get().then(
          (value) => value.docs.map(
            (doc){
              return CloudPlan(
                documentId: doc.id,
                ownerUserId: doc.data()[ownerUserIdFieldName] as String,
                text: doc.data()[textFieldName] as String,
          );
        }
      )
    );
      } catch (e) {
        throw Exception(e);
      }
    }
}