import 'package:flutter/material.dart';
import 'profile.dart';

void main() {
  runApp(EditProfile());
}

class EditProfile extends StatelessWidget {
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
                        'Ganti Profile',
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

              // ...

              SizedBox(height: 15),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 0.0),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Color(0xFFD9D9D9),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 20,
                        child: Icon(
                          Icons.person_2_outlined,
                          color: Color(0xff646262),
                          size: 140,
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            // Aksi yang akan diambil ketika ikon diklik
                            print('Ikon diklik');
                            // Tambahkan logika atau navigasi yang sesuai di sini
                          },
                          child: Icon(
                            Icons.edit_square,
                            color: Color(0xfff8b93a),
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

// ...

              SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Kageyama Tobio',
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 20,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Profil Anda',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 24,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'NIS/NISN',
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
                    controller: TextEditingController(
                        text: '654221'), // Isi dengan nilai awal
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
                          text: 'Nama',
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
                    controller: TextEditingController(
                        text: 'Kageyama Tobio'), // Isi dengan nilai awal
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
                          text: 'Nomor Telepon',
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
                    controller: TextEditingController(
                        text: '-'), // Isi dengan nilai awal
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
                          text: 'E-mail',
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
                    controller: TextEditingController(
                        text: 'kageyama@gmail.com'), // Isi dengan nilai awal
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
                          text: 'Jenis Kelamin',
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
                    controller: TextEditingController(
                        text: 'Laki-Laki'), // Isi dengan nilai awal
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
                          text: 'Tempat Lahir',
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
                    controller: TextEditingController(
                        text: 'Yokohama'), // Isi dengan nilai awal
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
                          text: 'Tanggal Lahir',
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
                    controller: TextEditingController(
                        text: '2006-01-01'), // Isi dengan nilai awal
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
                          text: 'No. Telp Orang Tua',
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
                    controller: TextEditingController(
                        text: '-'), // Isi dengan nilai awal
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
                          text: 'Alamat',
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
                    controller: TextEditingController(
                        text: 'Tokyo'), // Isi dengan nilai awal
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
                  SizedBox(height: 15),
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
                  SizedBox(height: 15),

                  // Lanjutkan proses yang sama untuk teks lainnya
                  // ...
                ],
              ),

              // ... your other widgets
            ],
          ),
        ),
      ),
    );
  }
}
