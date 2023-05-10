import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  const SelectButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    //final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 40,
      width: width * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
