import 'package:flutter/material.dart';
import 'package:student_frontend/screens/auth/widgets/or_divider.dart';
import 'package:student_frontend/screens/auth/widgets/other_button.dart';
import 'package:student_frontend/screens/auth/widgets/submit_button.dart';
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
                    _showLoginBottomSheet(context);
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

  void _showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        final double height = MediaQuery.of(context).size.height;
        final double width = MediaQuery.of(context).size.width;
        return SingleChildScrollView(
          child: Container(
            height: height * 0.7,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Welcome back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.008),
                const Text(
                  "Enter your details below",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: height * 0.018),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.018),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: height * 0.022),
                SubmitButtom(
                  backgroundColor: Palette.secondary,
                  bheight: 0.075,
                  bwidth: 0.92,
                  onPressed: () {},
                  text: 'Sign In',
                  textColor: Palette.white,
                ),
                SizedBox(height: height * 0.022),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forgot your password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.018),
                const OrDivider(),
                SizedBox(height: height * 0.010),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtherButton(
                      onPressed: () {},
                      ibheight: 0.080,
                      ibwidth: 0.35,
                      imagetext: Images.google,
                      text: 'Google',
                      textColor: Colors.black,
                      icon: null, iheight: 35, iwidth: 35,
                    ),
                    const SizedBox(width: 10),
                    OtherButton(
                      onPressed: () {},
                      ibheight: 0.080,
                      ibwidth: 0.35,
                      imagetext: Images.apple,
                      text: 'Apple',
                      textColor: Colors.black,
                      icon: null, iheight: 22, iwidth: 22,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
