import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/cloud/cloud_plan.dart';
import 'package:workout_app/cloud/cloud_storage.dart';
import 'package:workout_app/views/workouts_list.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({super.key});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {

  late final FirebaseCloudStorage _notesService;
  late final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    _notesService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 237, 205),
      appBar: AppBar(
        title: const Text('Stored Workouts'),
        backgroundColor: Color.fromARGB(255, 204, 213, 174),
      ),
      body: StreamBuilder(
        stream: _notesService.allNotes(ownerUserId: userId), 
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              if (snapshot.hasData) {
                final allNotes = snapshot.data as Iterable<CloudNote>;
                return WorkoutsList(notes: allNotes);
              } else {
                return CircularProgressIndicator();
              }
            default: return CircularProgressIndicator();
          }
        }),
    );
  }
}