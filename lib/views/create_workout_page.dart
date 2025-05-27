import 'package:flutter/material.dart';

class CreateWorkoutPage extends StatefulWidget {
  CreateWorkoutPage({super.key});

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {

  //CREATE MAP
  List<String> arms = ["Bicep", "Tricep", "Forearm", "Deltoid", "Trapezius"];

  List<String> legs = ["Quadriceps", "Hamstrings", "Calves"];

  List<String> back = ["Upper Back", "Lower Back", "Lats"];

  List<String> chest = ["Pectorals", "Sternum"];

  List<String> abs = ["Rectus Abdominis", "Obliques", "Transverse Abdominis"];

  List<bool> isCheckedList = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Arms'),
          CheckboxListTile(
          title: Text(arms[0]),
          value: isCheckedList[0],
          onChanged: (bool? newValue) {
            setState(() {
              isCheckedList[0] = newValue ?? false;
            });
          },
        ),
          CheckboxListTile(
            title: Text(arms[1]),
            value: isCheckedList[1],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[1] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(arms[2]),
            value: isCheckedList[2],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[2] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(arms[3]),
            value: isCheckedList[3],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[3] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(arms[4]),
            value: isCheckedList[4],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[4] = newValue ?? false;
              });
            },
          ),
          const Text('Legs'),
          CheckboxListTile(
            title: Text(legs[0]),
            value: isCheckedList[5],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[5] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(legs[1]),
            value: isCheckedList[6],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[6] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(legs[2]),
            value: isCheckedList[7],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[7] = newValue ?? false;
              });
            },
          ),
          const Text('Back'),
          CheckboxListTile(
            title: Text(back[0]),
            value: isCheckedList[8],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[8] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(back[1]),
            value: isCheckedList[9],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[9] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(back[2]),
            value: isCheckedList[10],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[10] = newValue ?? false;
              });
            },
          ),
          const Text('Chest'),
          CheckboxListTile(
            title: Text(chest[0]),
            value: isCheckedList[11],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[11] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(chest[1]),
            value: isCheckedList[12],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[12] = newValue ?? false;
              });
            },
          ),
          const Text('Abs'),
          CheckboxListTile(
            title: Text(abs[0]),
            value: isCheckedList[13],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[13] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(abs[1]),
            value: isCheckedList[14],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[14] = newValue ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text(abs[2]),
            value: isCheckedList[15],
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedList[15] = newValue ?? false;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/result');
            },
            child: Text('Create Workout')),

        ],
      )
    );
  }
}