// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_frontend/shared/exports.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({super.key});

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  final TextEditingController searchController = TextEditingController();
  List<Student> students = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStudents(); 
  }

  Future<void> fetchStudents() async {
    String url = 'https://studentapi-production.up.railway.app/api/v1/student';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> studentsData = jsonDecode(response.body);

      students = studentsData.map((json) => Student.fromJson(json)).toList();

    } else {
      print('Failed to fetch students. Error code: ${response.statusCode}');
    }

    setState(() {
      isLoading = false;
    });
  }

  void deleteStudent(int studentId) async {
    String apiUrl =
        'https://studentapi-production.up.railway.app/api/v1/student/$studentId';

    try {
      final response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        
        fetchStudents();
      } else {
        print('Failed to delete student. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to delete student. Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const DrawerWidget(),
      body: Stack(
        children: [
          Container(
            height: height * 0.26,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Palette.secondary, Color.fromARGB(255, 117, 115, 141)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: SearchBarWidget(
              onChanged: (String value) {},
              onSubmitted: (String value) {},
              textController: searchController,
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.24,
                ),
                const Text(
                  "Students",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                  child: isLoading
                      ? ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const ProfileCardShimmer();
                          },
                        ) : students.isEmpty
                            ? NetworkErrorWidget(
                                onRetry: fetchStudents,
                              )
                            
                      : ListView.builder(
                          itemCount: students.length,
                          itemBuilder: (context, index) {
                            final student = students[index];
                            return ProfileCard(
                              name: student.name,
                              email: student.email,
                              age: student.age,
                              imageUrl:
                                  'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                              ontap: () {
                                Get.to(
                                  StudentPage(
                                    name: student.name,
                                    email: student.email,
                                    age: student.age,
                                  ),
                                );
                              },
                              onLongPressDelete: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Delete Student'),
                                      content: const Text(
                                          'Are you sure you want to delete this student?'),
                                      actions: [
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Delete'),
                                          onPressed: () {
                                            deleteStudent(student.id);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class NetworkErrorWidget extends StatelessWidget {
  final Future<void> Function() onRetry;

  const NetworkErrorWidget({
    required this.onRetry,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 48,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          const Text(
            'Failed to fetch students',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Please check your internet connection and try again.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}


class ProfileCardShimmer extends StatelessWidget {
  const ProfileCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.08,
                  width: width * 0.14,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 15,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      width: 150,
                      height: 15,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      width: 80,
                      height: 15,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
