import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_frontend/shared/exports.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
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
              child: UpdateTop(ontapped: () { 
                 String userId = "123"; // Replace with the actual user ID
                  _showUserInfoDialog(context, userId);
               },),
            ),
            SafeArea(child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                const CreateWidget()
              ],
            ))
          ],
         ),
      ),
    );
  }

  void _showUserInfoDialog(BuildContext context, String userId) {
    // Simulating loading user information based on the provided userId
    String firstName = "John";
    String lastName = "Doe";
    String email = "eric@gmail.com";
    DateTime dateOfBirth = DateTime(1990, 1, 1);

    // Text editing controllers for user information
    TextEditingController firstNameController =
        TextEditingController(text: firstName);
    TextEditingController lastNameController =
        TextEditingController(text: lastName);
        TextEditingController emailController =
        TextEditingController(text: email);
    TextEditingController dateOfBirthController = TextEditingController(
      text: DateFormat('dd-MM-yyyy').format(dateOfBirth),
    );

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final double height = MediaQuery.of(context).size.height;
        final double width = MediaQuery.of(context).size.width;
        return AlertDialog(
          title: const Text("Edit User Information"),
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
                      "First Name",
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
                        controller: firstNameController,
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
                      "Last Name",
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
                        controller: lastNameController,
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
              onPressed: () {
                // Save the updated user information
                // String updatedFirstName = firstNameController.text;
                // String updatedLastName = lastNameController.text;
                // String updatedDateOfBirth = dateOfBirthController.text;
                //  String updatedEmail = emailController.text;
                // Perform the necessary operations with the updated data

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