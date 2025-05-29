import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 237, 205),
        appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: Color.fromARGB(255, 204, 213, 174),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) async {
                  if (value == 'logout') {
                    // Handle logout action
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, '/login');
                  } else if (value == 'personal_info') {
                    // Handle other actions if needed
                    Navigator.pushNamed(context, '/personal-info');
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                  const PopupMenuItem(
                    value: 'personal_info',
                    child: Text('Personal Info'),
                  ),
                ],
              )
            ],
        ),
        body: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/workouts');
              }, 
              child: const Text('Workouts Page'),
            ),
            
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create-workout');
              }, 
              child: const Text('Create Workout'),
            ),
          ]
        ),      
    );
  }
}