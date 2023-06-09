import 'package:flutter/material.dart';

import '../../shared/exports.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  late PageController _controller;

  bool onLastPage = false;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
      height: height,
      width: width,
      color: currentIndex == 1 ? Palette.white : const Color.fromARGB(255, 220, 223, 228),
      child: PageView.builder(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
              onLastPage = (index == 2);
            });
          },
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                Container(
                  decoration:  BoxDecoration(
                    color: currentIndex == 1
                        ? Palette.light
                        : Palette.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Image.asset(
                      ondata[index].pngimg,
                      height: height * 0.6,
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect:  WormEffect(
                            dotHeight: 4,
                            dotWidth: 16,
                            activeDotColor: currentIndex == 0
                                ? Colors.green
                                : Palette.secondary,
                            type: WormType.thin,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Text(
                          ondata[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex == 0
                                  ? Colors.green
                                  : Palette.secondary,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(
                          ondata[index].desc,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? Colors.green
                                  : Palette.secondary,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: height * 0.040,
                        ),
                        onLastPage
                            ? GetStartedButton(
                                onPressed: () {
                                  Get.to(() => const SelectAuth());
                                },
                              )
                            : ForwardButton(
                              onPressed: () {
                                _controller.animateToPage(
                                    index + 1,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeIn,
                                  );
                              },
                              backgroundColor: currentIndex == 0
                                  ? const Color.fromARGB(255, 153, 255, 157)
                                  : Palette.light,
                              iconColor: currentIndex == 0
                                  ? Colors.green
                                  : Palette.primary,
                            ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    ));
  }
}
