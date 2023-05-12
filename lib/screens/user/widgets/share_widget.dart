import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class ShareWidget extends StatefulWidget {
  const ShareWidget({super.key});

  @override
  State<ShareWidget> createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.065,
      width: width * 0.80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: height * 0.038,
              width: width * 0.25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(19),
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle WhatsApp sharing
                },
                label: const Text(
                  "Share",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Palette.secondary),
                ),
                icon: const Icon(
                  Icons.share,
                  size: 15,
                  color: Palette.secondary,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle WhatsApp sharing
            },
            child: Image.asset(
              Images.whatsapp,
              width: 28,
              height: 28,
              // color: Colors.green,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle WhatsApp sharing
            },
            child: Image.asset(
              Images.snapchat,
              width: 38,
              height: 38,
              // color: Colors.green,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle WhatsApp sharing
            },
            child: Image.asset(
              Images.twitter,
              width: 30,
              height: 30,
              // color: Colors.green,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle WhatsApp sharing
            },
            child: Image.asset(
              Images.linkedIn,
              width: 28,
              height: 28,
              // color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
