import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_frontend/model/student_model.dart';
import 'package:student_frontend/shared/exports.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({super.key});

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  final TextEditingController searchController = TextEditingController();

   List<Student> students = []; // Update the Student class according to your data structure

  @override
  void initState() {
    super.initState();
    fetchStudents(); // Fetch the students when the widget initializes
  }

 void fetchStudents() async {
    String url = 'https://studentapi-production.up.railway.app/api/v1/student';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Successful response
      List<dynamic> studentsData = jsonDecode(response.body);

      students = studentsData.map((json) => Student.fromJson(json)).toList();

      setState(() {}); // Trigger a rebuild after updating the students list
    } else {
      // Error handling
      print('Failed to fetch students. Error code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                SizedBox(
                  height: height * 0.556,
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return ProfileCard(
                        name: student.name,
                        email: student.email,
                        age: student.age,
                        imageUrl: 'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                        ontap: () {
                          Get.to( HomePage(
                                name: student.name,
                                email: student.email,
                                age: student.age,
                              ),);
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

//   final List<Student> students = [
//     Student(
//       name: 'John Doe',
//       email: 'johndoe@example.com',
//       age: 20,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//     Student(
//       name: 'Jane Smith',
//       email: 'janesmith@example.com',
//       age: 22,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//     Student(
//       name: 'Jane Smith',
//       email: 'janesmith@example.com',
//       age: 22,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//     Student(
//       name: 'Jane Smith',
//       email: 'janesmith@example.com',
//       age: 22,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//     Student(
//       name: 'Jane Smith',
//       email: 'janesmith@example.com',
//       age: 22,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//     Student(
//       name: 'Jane Smith',
//       email: 'janesmith@example.com',
//       age: 22,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//     Student(
//       name: 'Jane Smith',
//       email: 'janesmith@example.com',
//       age: 22,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//     Student(
//       name: 'Jane Smith',
//       email: 'janesmith@example.com',
//       age: 22,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//     Student(
//       name: 'Jane Smith',
//       email: 'janesmith@example.com',
//       age: 22,
//       imageUrl:
//           'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
//     ),
//   ];
// }

// class Student {
//   final String name;
//   final String email;
//   final int age;
//   final String imageUrl;

//   Student({
//     required this.name,
//     required this.email,
//     required this.age,
//     required this.imageUrl,
//   });
// }
