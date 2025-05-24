import 'package:flutter/material.dart';
import 'package:workout_app/views/boot_page.dart';
import 'package:workout_app/views/login_page.dart';
import 'package:workout_app/views/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
      home: RegisterPage(),
    );
  }
}