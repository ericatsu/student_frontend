import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String ltext;
  const OrDivider({super.key, required this.ltext});

  @override
  Widget build(BuildContext context) {
    return Row(
            children:  [
              const Expanded(
                child: Divider(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  ltext,
                  style: const TextStyle(fontSize: 14.5),
                ),
              ),
              const Expanded(
                child: Divider(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
            ],
          );
  }
}