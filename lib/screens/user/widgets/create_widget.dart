import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_frontend/shared/exports.dart';

class CreateWidget extends StatefulWidget {
  const CreateWidget({super.key});

  @override
  State<CreateWidget> createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  final TextEditingController _dateOfBirthController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  void dispose() {
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add Student',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Clear button action
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 218, 218, 218),
                    radius: 30,
                    backgroundImage: AssetImage(Images.addImage),
                  ),
                  TextButton(
                    onPressed: () {
                      // Change image button action
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(136, 168, 168, 168),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Change Image',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Remove button action
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(136, 168, 168, 168),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Remove',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: '',
                              hintText: '',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
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
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: '',
                              hintText: '',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),

              //Email
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),

              //Date of Birth
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
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (selectedDate != null) {
                            String formattedDate =
                                _dateFormat.format(selectedDate);
                            _dateOfBirthController.text = formattedDate;
                          }
                        },
                        controller: _dateOfBirthController,
                      ),
                    ),
                  ],
                ),
              ),
            
            SizedBox(
                height: height * 0.026,
              ),

              //Submit
              SubmitButtom(
                backgroundColor: Palette.secondary,
                bheight: 0.075,
                bwidth: 0.78,
                onPressed: () {
                  
                },
                text: 'Submit Student',
                textColor: Palette.white,
              ),

              SizedBox(
                height: height * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
