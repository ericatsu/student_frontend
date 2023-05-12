import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
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
              child: UpdateTop(ontapped: () {  },),
            ),
            SafeArea(child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                CreateWidget()
              ],
            ))
          ],
         ),
      ),
    );
  }
}