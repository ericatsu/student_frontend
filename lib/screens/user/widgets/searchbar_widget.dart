import 'package:flutter/material.dart';
import 'package:student_frontend/shared/exports.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController textController;
  final ValueChanged<String>? onSubmitted;
  const SearchBarWidget(
      {super.key,
      required this.onChanged,
      required this.textController,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTop(ontapped: () {  },),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: CupertinoSearchTextField(
            controller: textController,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            autofocus: true,
            itemColor: Colors.black,
            itemSize: 18,
            placeholder: "Search Students here",
            backgroundColor: const Color.fromARGB(255, 239, 239, 240),
            placeholderStyle: const TextStyle(
              color: Color.fromARGB(255, 167, 167, 167),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
