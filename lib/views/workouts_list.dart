import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:workout_app/cloud/cloud_plan.dart';

class WorkoutsList extends StatelessWidget {

  final Iterable<CloudNote> notes;
  
  const WorkoutsList({super.key, required this.notes});

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
          child: Container(            
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 189, 224, 254),
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
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
        );
      }
    );
  }
}