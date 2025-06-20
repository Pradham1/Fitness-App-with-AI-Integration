import 'package:firebase_auth/firebase_auth.dart';
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
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 204, 213, 174),
            automaticallyImplyLeading: false,
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
        
        Container(
          padding: const EdgeInsets.only(top:50),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/workouts'),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 189, 224, 254),
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 170,
                  width: 170,
                  alignment: Alignment.center,
                  child: const Text('Workouts \nPage',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  
                ),
              ),
              
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/create-workout'),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 189, 224, 254),
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 170,
                  width: 170,
                  alignment: Alignment.center,                
                  child: const Text('Create \nWorkout',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),  
                ),
              ),
            ]
          ),
        ),      
    );
  }
}