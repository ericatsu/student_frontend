import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GetStartedButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.secondary,
          border: Border.all(color: Colors.transparent),
        ),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
                color: Palette.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.5),
          ),
        ),
      ),
    );
  }
}
