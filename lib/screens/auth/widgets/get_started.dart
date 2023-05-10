import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  final VoidCallback ontapped;

  const GetStarted({super.key, required this.ontapped});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ontapped,
      child: Container(
        width: width * 0.2,
        height: height * 0.04,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}