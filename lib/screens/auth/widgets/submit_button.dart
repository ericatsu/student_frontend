import 'package:flutter/material.dart';

class SubmitButtom extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double bwidth;
  final double bheight;
  final VoidCallback onPressed;

  const SubmitButtom({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.text, required this.bwidth, required this.bheight,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * bheight,
      width: width * bwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        border: Border.all(color: Colors.transparent),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
