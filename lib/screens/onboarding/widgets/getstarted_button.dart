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
        height: 42,
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Palette.primary),
        ),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
                color: Palette.white,
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
