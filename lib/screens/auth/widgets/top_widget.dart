import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class TopWidget extends StatelessWidget {
  final VoidCallback ontapped;
  final String ttext;
  final String btext;
  const TopWidget({super.key, required this.ttext, required this.ontapped, required this.btext});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.30,
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
                    width: width * 0.15,
                  ),
                   Text(
                    ttext,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
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
                      child:  Center(
                        child: Text(
                          btext,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            child: Text(
              "StudInfo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Colors.white,
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
              color: Colors.white54,
            ),
          )
        ],
      ),
    );
  }
}
