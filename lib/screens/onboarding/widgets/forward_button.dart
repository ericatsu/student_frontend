import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class ForwardButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;

  const ForwardButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        border: Border.all(color: Colors.transparent),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              CupertinoIcons.arrow_right,
              color: iconColor,
              size: 23,
            ),
          ),
        ),
      ),
    );
  }
}
