import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class UpdateTop extends StatelessWidget {
  final VoidCallback ontapped;
  const UpdateTop({
    super.key,
    required this.ontapped,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              width: width * 0.41,
            ),
            InkWell(
              onTap: ontapped,
              child: Container(
                width: width * 0.2,
                height: height * 0.04,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.update,
                        size: 15,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
