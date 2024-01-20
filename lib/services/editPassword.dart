import 'package:flutter/material.dart';
import 'profile.dart';

void main() {
  runApp(EditPassword());
}

class EditPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Update Password',
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 24,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyProfile()),
                  // );
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xFF0A5896),
                  size: 25,
                  semanticLabel: 'Back',
                ),
              ),

              SizedBox(height: 40),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Password Lama',
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 16,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Color(0xFFB10000),
                        fontSize: 16,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller:
                    TextEditingController(text: '-'), // Isi dengan nilai awal
                style: TextStyle(
                  color: Color(0xFF0A5896),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                ),
                onChanged: (value) {
                  // Fungsi yang akan dijalankan ketika teks berubah
                  print('Nilai berubah: $value');
                  // Tambahkan logika atau manipulasi data yang sesuai di sini
                },
              ),
              SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Password Baru',
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 16,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Color(0xFFB10000),
                        fontSize: 16,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller:
                    TextEditingController(text: '-'), // Isi dengan nilai awal
                style: TextStyle(
                  color: Color(0xFF0A5896),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                ),
                onChanged: (value) {
                  // Fungsi yang akan dijalankan ketika teks berubah
                  print('Nilai berubah: $value');
                  // Tambahkan logika atau manipulasi data yang sesuai di sini
                },
              ),
              SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Confirm Password Baru',
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 16,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Color(0xFFB10000),
                        fontSize: 16,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller:
                    TextEditingController(text: '-'), // Isi dengan nilai awal
                style: TextStyle(
                  color: Color(0xFF0A5896),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                ),
                onChanged: (value) {
                  // Fungsi yang akan dijalankan ketika teks berubah
                  print('Nilai berubah: $value');
                  // Tambahkan logika atau manipulasi data yang sesuai di sini
                },
              ),

              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MyProfile()),
                    // );
                  },
                  child: Container(
                    width: 94,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0A5896),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 3,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Lanjutkan proses yang sama untuk teks lainnya
              // ...
            ],
          ),

          // ... your other widgets
        ),
      ),
    );
  }
}
