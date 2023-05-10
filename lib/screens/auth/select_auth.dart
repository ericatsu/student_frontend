import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class SelectAuth extends StatelessWidget {
  const SelectAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            Images.bg,
            fit: BoxFit.fill,
            height: height * 0.5,
            width: width,
          ),
          Container(
            color: Palette.secondary,
            width: width,
            height: height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  child: Text(
                    "StudInfo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),
                SizedBox(
                  width: width * 0.93,
                  child: const Text(
                    "Welcome to StudInfo. Get and create students here. Your can share",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                SelectButton(
                  onPressed: () {
                    Get.to(const SignUpPage());
                  },
                  backgroundColor: const Color(0xFFB4F2DD),
                  text: "Get Started",
                  textColor: Palette.secondary,
                ),
                const SizedBox(height: 16),
                SelectButton(
                  onPressed: () {
                    Get.to(const SignInPage());
                  },
                  backgroundColor: Colors.white24,
                  text: "Log In",
                  textColor: Palette.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}