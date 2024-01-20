import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  // Replace 'your_api_endpoint' with the actual API endpoint for login
  static const String apiUrl = 'http://192.168.1.8/api/login.php';

  // Function to perform login request
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': username,
          'password': password,
        },
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response JSON
        Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to login');
      }
    } catch (error) {
      // Handle any errors that occurred during the request
      throw Exception('Failed to connect to the server');
    }
  }
}
