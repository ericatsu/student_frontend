import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatefulWidget {
  const CircularButton({super.key});

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  int pressCount = 0;

  void toggleButton() {
    setState(() {
      pressCount = (pressCount + 1) % 4; // Cycle through 0, 1, 2, 3
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: toggleButton,
        child: Container(
          width: 92.60,
          height: 92.60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: Stack(
            children: [
              // TODO : This cirlce, Thin Circle
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color:
                          pressCount == 3 ? Colors.orange : Colors.grey,
                      width: 2.5),
                ),
              ),
              Center(
                child: Container(
                  width: 71.60,
                  height: 71.60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange 
                  ),
                  child: const Icon(
                    CupertinoIcons.forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
