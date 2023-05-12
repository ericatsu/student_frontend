import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerWidget(),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
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
            child: HomeTop(
              ontapped: () {},
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
                  const MainCard(
                    email: 'johndoe@example.com',
                    image:
                        'https://cdn.pixabay.com/photo/2022/01/17/22/20/subtract-6945896_960_720.png',
                    name: 'Eric Atsu',
                    stdId: '10743340',
                    stdage: 20,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.36,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      children: const [
                        GridCard(
                          icon: CupertinoIcons.book,
                          text: 'Syllabus',
                        ),
                        GridCard(
                          icon: CupertinoIcons.list_number,
                          text: 'Attendance',
                        ),
                        GridCard(
                          icon: CupertinoIcons.waveform,
                          text: 'Activities',
                        ),
                        GridCard(
                          icon: CupertinoIcons.doc_text_search,
                          text: 'Result',
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
