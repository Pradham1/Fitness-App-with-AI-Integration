import 'package:flutter/material.dart';
import 'package:workout_app/views/boot_page.dart';
import 'package:workout_app/views/create_workout_page.dart';
import 'package:workout_app/views/api_call.dart';
import 'package:workout_app/views/home_page.dart';
import 'package:workout_app/views/login_page.dart';
import 'package:workout_app/views/personal_info_page.dart';
import 'package:workout_app/views/register_page.dart';
import 'package:workout_app/views/resultant_workout.dart';
import 'package:workout_app/views/workouts_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
      home: CreateWorkoutPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/create-workout': (context) => CreateWorkoutPage(),
        '/workouts': (context) => WorkoutsPage(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/personal-info': (context) => const PersonalInfoPage(),
        '/result': (context) => const ResultantWorkout(),
        '/api-call': (context) => ChatScreen(),
      },
    );
  }
}