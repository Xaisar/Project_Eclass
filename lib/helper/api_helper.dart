import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:mobile_eclass/model/user.dart';

class ApiHelper {
  static const String _apiUrl = 'https://localhost/api/login.php';

  Future<dynamic> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_apiUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
