import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mobile_eclass/constant/const.dart';

class Profile_Api extends GetConnect {
  Future<dynamic> getProfile(String userProfile) async {
    print(userProfile);
    final response = await http.post(
     Uri.parse('$url/student/Profil'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        //ganti username untuk ganti user di tampilan dashboard
        'username': '$userProfile'
      }));

      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      return data;
  }

  Future<dynamic> postProfile(String username) async {
    final response = await http.post(
     Uri.parse('$url/student/classes2'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        //ganti username untuk ganti user di tampilan dashboard
        'username': '$username'
      }));

      final Map<String, dynamic> message = json.decode(response.body);
      return message;
  }

  Future<dynamic> changePassword(String old_password, String new_password) async {
    final response = await http.post(
     Uri.parse('$url/student/classes2'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        //ganti username untuk ganti user di tampilan dashboard
        'old_password': '$old_password',
        'new_password': '$new_password'
      }));

      final Map<String, dynamic> message = json.decode(response.body);
      return message;
  }
}