import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Student Info',
      home: OnboardScreen(),
    );
  }
}


