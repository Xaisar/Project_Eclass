import 'package:flutter/material.dart';
import 'package:mobile_eclass/dashboard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_eclass/model/siswa_model.dart';

import 'constant/const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  Future<void> authenticate(BuildContext context) async {
    final response = await http.post(
      // Uri.parse('https://ce0c-125-166-118-94.ngrok-free.app/api/login'),
      Uri.parse('$url/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': usernameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String token = data['token'];
      // print('Token : $token');
      final Map<String, dynamic> a = data['student'];
      final String picture = a['picture'];
      // print('Picture : $picture');
      final String name = a['name'];
      // print('Name : $name');
      final String username = a["username"];

      // print('Token : $token');
      // print('Picture : $picture');
      // print('Name : $name');
      // print('Berhasil');

      Siswa user = Siswa(token: token, name: name, username: username, picture: picture);
      // print(user);
      print(user.token);
      print(user.name);
      print(user.picture);

      // final Map<String, dynamic> data = jsonDecode(response.body);

      // if (data['status'] == 'success') {
      //   // Login berhasil
      //   print(data['message']);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage(argument1: user.username)),
      );
      //   } else {
      //   //   // Login gagal
      //   //   print(data['message']);
      //   // }
    } else {
      // Gagal terhubung ke server
      print('Username atau password salah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 85),
            const Text(
              'WELCOME BACK!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: "work sans",
                color: Color(0xFF0A5896), // Warna teks biru
              ),
            ),

            const SizedBox(height: 9),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign in to continue to App.',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "work sans",
                    color: Color(0xff3493e0),
                    // Warna teks biru
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Image.asset(
              "assets/image/logo.png",
              height: 150, // Sesuaikan tinggi gambar sesuai kebutuhan
              width: 210, // Sesuaikan lebar gambar sesuai kebutuhan
            ),
            const SizedBox(height: 50),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Sudut bulat dengan radius 5
                ),
              ),
              style: const TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 16,
                // Ganti dengan nama font Work Sans yang sesuai
              ),
            ),

            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Sudut bulat dengan radius
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Color.fromRGBO(
                      113,
                      158,
                      194,
                      _obscurePassword ? 1.0 : 0.5,
                    ),
                    // Warna ikon mata dengan opacity
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: _obscurePassword,
              style: const TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 16, // Ganti dengan nama font Work Sans yang sesuai
              ),
            ),

            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Remember me',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "work sans",
                    color: Color(0xFF2067A0), // Warna teks biru
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "work sans",
                      color: Color(0xFF2067A0), // Warna teks biru
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 27),
            ElevatedButton(
              onPressed: () {
                authenticate(context);
                // Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardPage()));
                // Tambahkan logika autentikasi atau tindakan yang sesuai di sini
              },
              child: const Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'WorkSans',
                  // Ganti dengan nama font Work Sans yang sesuai
                  fontSize: 16,
                  
                  // Ganti ukuran font sesuai keinginan
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0A5896),
                minimumSize: Size(double.infinity, 50),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),

            const SizedBox(height: 35),
            const Text(
              'By creating an account,you accept our',
              style: TextStyle(
                fontSize: 12,

                fontFamily: "inter",
                color: Color(0xFF64608A), // Warna teks biru
              ),
            ),
            const Row(
              children: [
                Spacer(),
                Text(
                  'Terms and conditions',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "inter",
                    color: Color(0xff0f0f0f), // Warna teks biru
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'you read our',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "inter",
                    color: Color(0xFF64608A), // Warna teks biru
                  ),
                ),
                SizedBox(width: 5), // Jarak antara teks
                Text(
                  'Privacy Policy.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "inter",
                    color: Color(0xff0f0f0f), // Warna teks biru
                  ),
                ),
                Spacer(),
              ],
            ),

            // Anda dapat menambahkan tombol atau elemen lain di sini
          ],
        ),
      ),
    );
  }
}
