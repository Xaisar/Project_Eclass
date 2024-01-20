import 'dart:convert';

import 'package:flutter/foundation.dart';

// List<Siswa> postFromJson(String str) =>
    // List<Siswa>.from(json.decode(str).map(s(x) => Siswa.fromMap(x)));

class Siswa {
  String token;
  String name;
  String username;
  String picture;

    Siswa({
    required this.token,
    required this.name,
    required this.username,
    required this.picture,
  });

  factory Siswa.fromJson(Map<String,dynamic> json) {
    return Siswa(
      token: json['token'].toString(),
      name: json['name'].toString(),
      username: json['username'].toString(),
      picture: json['picture'].toString()
    );   
  } 
}
