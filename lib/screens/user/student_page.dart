import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class StudentPage extends StatelessWidget {
  final String name;
  final String email;
  final int age;
  const StudentPage(
      {super.key, required this.name, required this.email, required this.age});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // drawer: const DrawerWidget(),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: height * 0.26,
            width: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(CupertinoIcons.back, color: Colors.white,)),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  MainCard(
                    email: email,
                    image:
                        'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                    name: name,
                    stdId: '10743340',
                    stdage: age,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.36,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      children: [
                        GridCard(
                          icon: CupertinoIcons.book,
                          text: 'Syllabus',
                          onTap: () {},
                        ),
                        GridCard(
                          icon: CupertinoIcons.list_number,
                          text: 'Attendance',
                          onTap: () {},
                        ),
                        GridCard(
                          icon: CupertinoIcons.waveform,
                          text: 'Activities',
                          onTap: () {},
                        ),
                        GridCard(
                          icon: CupertinoIcons.doc_text_search,
                          text: 'Result',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const ShareWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
