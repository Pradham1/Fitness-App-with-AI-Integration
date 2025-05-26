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
        appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: const Color.fromARGB(255, 240, 240, 220),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'logout') {
                    // Handle logout action
                    print('Logout clicked');
                  } else if (value == 'personal_info') {
                    // Handle other actions if needed
                    print('Personal Info clicked');
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            

            
            OutlinedButton(
              onPressed: () {
                print('Workouts Page button clicked');
              }, 
              child: const Text('Workouts Page'),
            ),
            
            OutlinedButton(
              onPressed: () {
                print('Create Workout button clicked');
              }, 
              child: const Text('Create Workout'),
            ),

          ]


        ),      
    );
  }
}