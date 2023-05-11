import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const GridCard({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  size: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}