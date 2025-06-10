import 'package:flutter/material.dart';
import 'package:workout_app/services/auth/auth_service.dart';
import 'package:workout_app/services/crud/workouts_service.dart';


class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({super.key});

  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {


  late final WorkoutsService _workoutsService;

  void initState() {
    _workoutsService = WorkoutsService();
    _workoutsService.open();
    super.initState();
    
  }

  void dispose() {
    _workoutsService.close();
    super.dispose();
  }

  List<String> workouts = [];

  void _generateWorkout() {
    setState(() {
      workouts.add('Workout ${workouts.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),

      ),
    );
  }
}
