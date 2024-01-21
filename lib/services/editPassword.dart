import 'package:flutter/material.dart';
import 'package:mobile_eclass/api/profil_api.dart';
import 'package:mobile_eclass/model/siswa_model.dart';
import 'profile.dart';

class EditPassword extends StatefulWidget{
  Siswa user;
  EditPassword({Key? key, required this.user}):super(key: key);
  @override
  State<EditPassword> createState() => _EditPasswordState(user1: user);
}

class _EditPasswordState extends State<EditPassword> {
  Siswa user1;
  _EditPasswordState({required this.user1});

  String oldPassword = "";
  String newPassword = "";
  String konfirmasi = "";
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                  },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xFF0A5896),
                  size: 25,
                  semanticLabel: 'Back',
                )),
          title: Text(
                      "Update Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        height: 0,
                        fontSize: 24,
                        fontFamily: 'WorkSans-Medium',
                        color: Color(0xFF0A5896),
                        letterSpacing: 0.96,
                      ),
                    ),
          actions: [
              TextButton(
                        child: Text('Read All'),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: Color(0xFF0A5896),
                            fontSize: 11,
                            fontFamily: 'WorkSans-Medium',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          print('Pressed');
                        },
                      ),
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              TextField( // Isi dengan nilai awal
                style: TextStyle(
                  color: Color(0xFF0A5896),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: "Input Password lama",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                ),
                onChanged: (value) {
                  // Fungsi yang akan dijalankan ketika teks berubah
                  oldPassword = value;
                  // print('Nilai berubah: $value');
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
              TextField(// Isi dengan nilai awal
                style: TextStyle(
                  color: Color(0xFF0A5896),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: "Input Password baru",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                ),
                onChanged: (value) {
                  // Fungsi yang akan dijalankan ketika teks berubah
                  newPassword = value;
                  // print('Nilai berubah: $value');
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
              TextField( // Isi dengan nilai awal
                style: TextStyle(
                  color: Color(0xFF0A5896),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: "Confirmasi Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcddeec)),
                  ),
                ),
                onChanged: (value) {
                  // Fungsi yang akan dijalankan ketika teks berubah
                  konfirmasi = value;
                  // print('Nilai berubah: $value');
                  // Tambahkan logika atau manipulasi data yang sesuai di sini
                },
              ),

              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    if (newPassword == konfirmasi){
                      Profile_Api().changePassword(user1.id, oldPassword, newPassword).then((value){ 
                        print(value['berhasil']);
                        print(value['message']);
                        if(value['berhasil'] == 'true'){
                          Navigator.pop(context);
                        }
                        });
                    } else {
                      print('konfirmasi yang anda masukan salah');
                    }
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
