import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:student_frontend/shared/exports.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({
    super.key,
  });
  

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const DrawerWidget(),
      body: Stack(
        children: [
          Container(
            height: height * 0.26,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Palette.secondary, Color.fromARGB(255, 117, 115, 141)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: UpdateTop(
              ontapped: () {
                int studentId = 1;
                _showUserInfoDialog(context, studentId);
              },
            ),
          ),
          SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              const CreateWidget()
            ],
          ))
        ],
      ),
    );
  }

  void _showUserInfoDialog(BuildContext context, int studentId) {
    // Text editing controllers for user information
    TextEditingController idController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController dateOfBirthController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final double height = MediaQuery.of(context).size.height;
        final double width = MediaQuery.of(context).size.width;
        return AlertDialog(
          title: const Text("Edit Student Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: width * 0.36,
                height: height * 0.095,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Student ID",
                      style: TextStyle(
                          color: Color.fromARGB(255, 122, 124, 126),
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: width * 0.36,
                      height: height * 0.06,
                      child: TextField(
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: '',
                          hintText: '',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        controller: idController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.36,
                height: height * 0.095,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Student Name",
                      style: TextStyle(
                          color: Color.fromARGB(255, 122, 124, 126),
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: width * 0.36,
                      height: height * 0.06,
                      child: TextField(
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: '',
                          hintText: '',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        controller: nameController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.78,
                height: height * 0.095,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                          color: Color.fromARGB(255, 122, 124, 126),
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: width * 0.78,
                      height: height * 0.06,
                      child: TextField(
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: '',
                          hintText: '',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        controller: emailController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.78,
                height: height * 0.095,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Date of Birth",
                      style: TextStyle(
                        color: Color.fromARGB(255, 122, 124, 126),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.78,
                      height: height * 0.06,
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 15.6,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          suffixIcon: const Icon(CupertinoIcons.calendar),
                          labelText: '',
                          hintText: '',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        controller: dateOfBirthController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                // Prepare the updated data
                String updatedName = nameController.text;
                String updatedEmail = emailController.text;
                String updatedDateOfBirth = dateOfBirthController.text;

                // Prepare the API URL with the provided studentId
                String apiUrl =
                    'https://studentapi-production.up.railway.app/api/v1/student/$studentId';

                // Prepare the request body
                Map<String, String> requestBody = {
                  'name': updatedName,
                  'email': updatedEmail,
                  'dateOfBirth': updatedDateOfBirth,
                };

                // Send the PUT request to update the student's information
                try {
                  final response = await http.put(
                    Uri.parse(apiUrl),
                    body: requestBody,
                  );

                  if (response.statusCode == 200) {
                    // Success! Handle the updated information
                    // ...
                  } else {
                    // Error handling
                    print(
                        'Failed to update student information. Status code: ${response.statusCode}');
                  }
                } catch (error) {
                  // Error handling
                  print('Failed to update student information. Error: $error');
                }

                // Close the dialog
                Navigator.pop(dialogContext);
              },
              child: const Text("Save"),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without saving any changes
                Navigator.pop(dialogContext);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
