import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final int age;
  final String imageUrl;
  
  final VoidCallback ontap;

  const ProfileCard({
    required this.name,
    required this.email,
    required this.age,
    required this.imageUrl,
    Key? key, required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    width: width * 0.14,
                    height: height * 0.08,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      'Age: $age',
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
