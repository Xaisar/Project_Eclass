import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mobile_eclass/constant/const.dart';

class Notifikasi_Api extends GetConnect {

  Future<dynamic> getNotifikasi(String id) async {
    final response = await http.post(
      // Uri.parse('https://ce0c-125-166-118-94.ngrok-free.app/api/login'),
      Uri.parse('$url/student/Notifikasi'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        //ganti username untuk ganti user di tampilan dashboard
        'id': '$id'
      }));
    
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    
  }
}