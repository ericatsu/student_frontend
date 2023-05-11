import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class HomeTop extends StatelessWidget {
  final VoidCallback ontapped;
  const HomeTop({
    super.key,
    required this.ontapped,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                CupertinoIcons.line_horizontal_3_decrease,
                size: 25,
                color: Palette.white,
              ),
            ),
            SizedBox(
              width: width * 0.04,
            ),
            const Text(
              "DASHBOARD",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: width * 0.37,
            ),
            IconButton(
              onPressed: ontapped,
              icon: const Icon(
                CupertinoIcons.bell,
                size: 25,
                color: Palette.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
