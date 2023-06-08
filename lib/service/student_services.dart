import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_frontend/shared/exports.dart';

void fetchStudents() async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // Successful response
    List<dynamic> studentsData = jsonDecode(response.body);

    // Process the student data
    // ...
  } else {
    // Error handling
    print('Failed to fetch students. Error code: ${response.statusCode}');
  }
}

//Create Student
void createStudent(String name, String email, String dob, int age) async {
  Map<String, dynamic> studentData = {
    'name': name,
    'email': email,
    'dob': dob,
    'age': age,
  };

  var response = await http.post(Uri.parse(url), body: studentData);

  if (response.statusCode == 201) {
    // Successful response
    var createdStudent = jsonDecode(response.body);

    // Process the created student data
    // ...
  } else {
    // Error handling
    print('Failed to create student. Error code: ${response.statusCode}');
  }
}

//Update an existing student
void updateStudent(
    int id, String name, String email, String dob, int age) async {
  Map<String, dynamic> studentData = {
    'name': name,
    'email': email,
    'dob': dob,
    'age': age,
  };

  var response = await http.put(Uri.parse('$url/$id'), body: studentData);

  if (response.statusCode == 200) {
    // Successful response
    var updatedStudent = jsonDecode(response.body);

    // Process the updated student data
    // ...
  } else {
    // Error handling
    print('Failed to update student. Error code: ${response.statusCode}');
  }
}

void deleteStudent(int id) async {
  var response = await http.delete(Uri.parse('$url/$id'));

  if (response.statusCode == 204) {
    // Successful response
    print('Student with ID $id has been deleted.');
  } else {
    // Error handling
    print('Failed to delete student. Error code: ${response.statusCode}');
  }
}
