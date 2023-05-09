import 'package:flutter/material.dart';

class OtherButton extends StatelessWidget {
  final Color textColor;
  final String text;
  final String imagetext;
  final double ibwidth;
  final double ibheight;
  final double iheight;
  final double iwidth;
  final VoidCallback onPressed;
  const OtherButton(
      {super.key,
      required this.textColor,
      required this.imagetext,
      required this.ibwidth,
      required this.ibheight,
      required this.onPressed,
      required this.text, required icon, required this.iheight, required this.iwidth});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * ibheight,
        width: width * ibwidth,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(19),
        ),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Image.asset(
            imagetext,
            height: iheight,
            width: iwidth,
          ),
          label: Text(text, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500, color: textColor),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
