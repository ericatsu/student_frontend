import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_frontend/shared/exports.dart';

class StudentCount extends StatefulWidget {
  const StudentCount({super.key});

  @override
  State<StudentCount> createState() => _StudentCountState();
}

class _StudentCountState extends State<StudentCount> {
  int studentCount = 0;

  @override
  void initState() {
    super.initState();
    fetchStudents(); // Call fetchStudents method in initState
  }

  void fetchStudents() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> studentsData = jsonDecode(response.body);
      studentCount = studentsData.length;
      setState(() {});
    } else {
      print('Failed to fetch students. Error code: ${response.statusCode}');
    }
  }


  @override
  Widget build(BuildContext context) {
    // ...

    return Scaffold(
      body: Stack(
        children: [
          // ...

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ...

                  StudentCountWidget(studentCount: studentCount),

                  // ...
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentCountWidget extends StatelessWidget {
  final int studentCount;

  const StudentCountWidget({
    Key? key,
    required this.studentCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.people,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            'Total Students: $studentCount',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

