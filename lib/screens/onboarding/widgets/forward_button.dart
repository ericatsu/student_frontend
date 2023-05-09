import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class ForwardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ForwardButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Palette.light,
        border: Border.all(color: Palette.light),
      ),
      child: InkWell(
        onTap: onPressed,
        child: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              CupertinoIcons.arrow_right,
              color: Palette.primary,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
