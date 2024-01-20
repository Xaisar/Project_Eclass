import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mobile_eclass/constant/const.dart';

class Dashboard_Api extends GetConnect {

  Future<dynamic> getDashboard(String username) async {
    final response = await http.post(
      // Uri.parse('https://ce0c-125-166-118-94.ngrok-free.app/api/login'),
      Uri.parse('$url/student/classes2'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        //ganti username untuk ganti user di tampilan dashboard
        'username': '$username'
      }));
    
      final Map<String, dynamic> data = json.decode(response.body);
      // print(data['user']['name']);
      return data;
    
  }
}