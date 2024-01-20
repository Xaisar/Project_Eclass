import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mobile_eclass/constant/const.dart';

class DetailKelas_Api extends GetConnect {

  Future<dynamic> getDetailKelas(String id, String username) async {
    final response = await http.post(
      // Uri.parse('https://ce0c-125-166-118-94.ngrok-free.app/api/login'),
      Uri.parse('$url/student/classes2/detailCourse'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        //ganti username untuk ganti user di tampilan dashboard
        'id': '$id',
        'username': '$username'
      }));
    
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
  }

  Future<dynamic> postKehadiran(String id_course , String id_student, var number_of_meeting) async {
    DateTime date = DateTime.now();
    String f = "${date.year}-${date.month}-${date.day}";
    print(f);
    print(id_course);
    print(id_student);
    print(number_of_meeting);
    final response = await http.post(
      // Uri.parse('https://ce0c-125-166-118-94.ngrok-free.app/api/login'),
      Uri.parse('$url/student/classes2/kehadiran'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        //ganti username untuk ganti user di tampilan dashboard
        'id_course': '$id_course',
        'id_student': '$id_student',
        'number_of_meeting': '$number_of_meeting',
        'date': '$f'
      }));
    
      final Map<String, dynamic> message = json.decode(response.body);
      return message;
  }

}