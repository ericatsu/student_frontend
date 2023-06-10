import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String password = '';
  PasswordStrength strength = PasswordStrength.weak;

  void _checkPasswordStrength(String value) {
    setState(() {
      password = value;
      strength = _calculatePasswordStrength(value);
    });
  }

  PasswordStrength _calculatePasswordStrength(String value) {
    if (value.length < 6) {
      return PasswordStrength.weak;
    } else if (value.length < 10) {
      return PasswordStrength.medium;
    } else {
      return PasswordStrength.strong;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Palette.secondary, Color.fromARGB(255, 117, 115, 141)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          children: [
            TopWidget(
              ontapped: () {
                Get.to(const SignInPage());
              },
              ttext: 'Already have an account?',
              btext: 'Sign In',
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Colors.white,
              ),
              height: height * 0.70,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: height * 0.008),
                    const Text(
                      "Join for free",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.008),
                    const Text(
                      "Join for free. No payment needed",
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
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.018),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Your name',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.018),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 14),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50,
                                child: LinearProgressIndicator(
                                  value: strength.index /
                                      PasswordStrength.values.length,
                                  backgroundColor: Colors.grey[300],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    _getProgressColor(strength),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7),
                              Text(
                                strength.toString().split('.').last,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: _getProgressColor(strength)),
                              ),
                            ],
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                      onChanged: _checkPasswordStrength,
                    ),
                    SizedBox(height: height * 0.022),
                    //Submit
                    SubmitButtom(
                      backgroundColor: Palette.secondary,
                      bheight: 0.075,
                      bwidth: 0.92,
                      onPressed: () {
                        Get.to(const NavSection());
                      },
                      text: 'Sign Up',
                      textColor: Palette.white,
                    ),
                    SizedBox(height: height * 0.018),
                    const OrDivider(
                      ltext: 'Or sign up with',
                    ),
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
                          icon: null,
                          iheight: 35,
                          iwidth: 35,
                        ),
                        const SizedBox(width: 10),
                        OtherButton(
                          onPressed: () {
                            Get.to(const NavSection());
                          },
                          ibheight: 0.080,
                          ibwidth: 0.35,
                          imagetext: Images.apple,
                          text: 'Apple',
                          textColor: Colors.black,
                          icon: null,
                          iheight: 22,
                          iwidth: 22,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getProgressColor(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak:
        return Colors.red;
      case PasswordStrength.medium:
        return Colors.orange;
      case PasswordStrength.strong:
        return Colors.green;
    }
  }
}

enum PasswordStrength {
  weak,
  medium,
  strong,
}
