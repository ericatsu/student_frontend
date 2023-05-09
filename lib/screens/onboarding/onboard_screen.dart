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
      color: currentIndex == 0 ? Palette.white : Palette.primary,
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
                  decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.only(
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
                  color: currentIndex == 0 ? Palette.white : Palette.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ondata[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex == 0
                                  ? Palette.primary
                                  : Palette.white,
                              fontSize: 23.5),
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
                                  ? Palette.primary
                                  : Palette.white,
                              fontSize: 14.5),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        onLastPage
                            ? GetStartedButton(
                                onPressed: () {
                                  Get.to(() => const HomePage());
                                },
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ForwardButton(
                                    onPressed: () {
                                      _controller.jumpToPage(3);
                                    },
                                  ),
                                ],
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
