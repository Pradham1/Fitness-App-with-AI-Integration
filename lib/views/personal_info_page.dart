import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
        backgroundColor: Color.fromARGB(255, 240, 240, 220),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //age
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Age',
                hintText: 'Enter your age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5),
                ),
              ),
            ),

            //weight
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                hintText: 'Enter your weight',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5),
                ),
              ),
            ),

            //height
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                hintText: 'Enter your height',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5),
                ),
              ),
            ),

            //bodyfat %
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Body Fat %',
                hintText: 'Enter your body fat percentage',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 5),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              print('Submit');
            }, child: const Text('Submit')),

            
          ],
        )
      ),
    );
  }
}