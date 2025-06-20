import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:workout_app/cloud/cloud_plan.dart';
import 'package:workout_app/cloud/cloud_storage.dart';

class WorkoutsList extends StatelessWidget {

  final Iterable<CloudNote> notes;
  final FirebaseCloudStorage _notesService = FirebaseCloudStorage();
  
  WorkoutsList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: notes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 8.0,
        
      ),
      itemBuilder: (context, index) {
        final note = notes.elementAt(index);
        return SingleChildScrollView(          
          child: Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) async {
                    await _notesService.deleteNote(documentId: note.documentId);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Container(            
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 189, 224, 254),
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                note.text,
                maxLines: 10,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                ),                  
            ),
          ),
        );
      }
    );
  }
}