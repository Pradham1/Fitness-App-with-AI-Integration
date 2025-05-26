import 'package:flutter/material.dart';


class WorkoutsPage extends StatefulWidget {
  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  List<String> workouts = [];

  void _generateWorkout() {
    setState(() {
      workouts.add('Workout ${workouts.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Workouts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: workouts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  workouts[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateWorkout,
        backgroundColor: const Color.fromARGB(255, 147, 115, 19),
        child: Icon(Icons.add),
        tooltip: 'Generate Workout',
      ),
    );
  }
}
