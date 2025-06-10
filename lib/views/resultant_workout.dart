import 'package:flutter/material.dart';


class ResultantWorkout extends StatefulWidget {
  const ResultantWorkout({super.key});

  @override
  State<ResultantWorkout> createState() => _ResultantWorkoutState();
}

class _ResultantWorkoutState extends State<ResultantWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}