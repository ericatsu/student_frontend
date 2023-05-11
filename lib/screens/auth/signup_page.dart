import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              ttext: 'Already have an account?', btext: 'Sign In',
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
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.eye,
                              size: 18,
                            )),
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
                          onPressed: () {},
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
}
