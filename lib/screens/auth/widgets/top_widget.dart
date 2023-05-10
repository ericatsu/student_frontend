import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.32,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette.secondary, Color.fromARGB(255, 117, 115, 141)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 18,
                        color: Palette.white,
                      )),
                  SizedBox(
                    width: width * 0.2,
                  ),
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  GetStarted(
                    ontapped: () {
                      Get.to(const SignUpPage());
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: width * 0.86,
            height: height * 0.018,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Colors.white60,
            ),
          )
        ],
      ),
    );
  }
}
