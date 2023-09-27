import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_frontend/shared/exports.dart';

List<Student> students = [];
Future<void> fetchStudents() async {
  
    String url = 'https://studentapi-production.up.railway.app/api/v1/student';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> studentsData = jsonDecode(response.body);

      students = studentsData.map((json) => Student.fromJson(json)).toList();

    } else {
      print('Failed to fetch students. Error code: ${response.statusCode}');
    }

    
  }

  void deleteStudent(int studentId) async {
    String apiUrl =
        'https://studentapi-production.up.railway.app/api/v1/student/$studentId';

    try {
      final response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        
        fetchStudents();
      } else {
        print('Failed to delete student. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to delete student. Error: $error');
    }
  }
