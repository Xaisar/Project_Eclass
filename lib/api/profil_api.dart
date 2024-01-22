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

  Future<dynamic> postProfile(String username, String id, String nama, String telpon, String email, String tempat_lahir, String tanggal_lahir, String telpon_orangtua, String alamat) async {
    print(id);
    print(nama);
    print(telpon);
    print(email);
    print(tanggal_lahir);
    print(tempat_lahir);
    print(telpon_orangtua);
    print(alamat);

    final response = await http.post(
     Uri.parse('$url/student/GantiProfile'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username' : '$username',
        'id': '$id',
        'nama': '$nama',
        'telpon': '$telpon',
        'email': '$email',
        'tempat_lahir': '$tempat_lahir',
        'tanggal_lahir': '$tanggal_lahir',
        'telpon_orangtua': '$telpon_orangtua',
        'alamat': '$alamat'
      }));

      final Map<String, dynamic> message = json.decode(response.body);
      return message;
  }

  Future<dynamic> changePassword(String id, String old_password, String new_password) async {
    final response = await http.post(
     Uri.parse('$url/student/GantiPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        //ganti username untuk ganti user di tampilan dashboard
        'id': '$id',
        'old_password': '$old_password',
        'new_password': '$new_password'
      }));

      final Map<String, dynamic> message = json.decode(response.body);
      return message;
  }
}