import 'package:flutter/material.dart';
import 'package:mobile_eclass/api/profil_api.dart';
import 'package:mobile_eclass/model/profile_model.dart';
import 'package:mobile_eclass/model/siswa_model.dart';
import 'profile.dart';

class EditProfile extends StatefulWidget{
  Siswa user;
  Profile profile;
  EditProfile({Key? key, required this.user, required this.profile}):super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState(user1: user, profile1: profile);
}

class _EditProfileState extends State<EditProfile> {
  Siswa user1;
  Profile profile1;
  _EditProfileState({required this.user1, required this.profile1});

  String nama = "";
  String telpon = "";
  String email = "";
  String tempat_lahir = "";
  String tanggal_lahir = "";
  String telpon_orangtua = "";
  String alamat = "";

  @override
  initState(){
    super.initState();
    nama = profile1.nama;
    telpon = profile1.telpon;
    email = profile1.email;
    tempat_lahir = profile1.tempat_lahir;
    tanggal_lahir = profile1.tanggal_lahir;
    telpon_orangtua = profile1.telpon_orangtua;
    alamat = profile1.alamat;
    print(nama);
    print(telpon);
    print(email);
    print(tanggal_lahir);
    print(tempat_lahir);
    print(telpon_orangtua);
    print(alamat);
  }
 
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
                      "Ganti Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        height: 0,
                        fontSize: 24,
                        fontFamily: 'WorkSans-Medium',
                        color: Color(0xFF0A5896),
                        letterSpacing: 0.96,
                      ),
                    ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
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
                      profile1.nama,
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
                        text: profile1.nisn), // Isi dengan nilai awal
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
                    enabled: false,
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
                        text: profile1.nama), // Isi dengan nilai awal
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
                      nama = value;
                      // print('Nilai berubah: $value');
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
                        text: profile1.telpon), // Isi dengan nilai awal
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
                      telpon = value;
                      // print('Nilai berubah: $value');
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
                        text: profile1.email), // Isi dengan nilai awal
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
                      email = value;
                      // print('Nilai berubah: $value');
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
                        text: profile1.gender), // Isi dengan nilai awal
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
                    enabled: false,
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
                        text: profile1.tempat_lahir), // Isi dengan nilai awal
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
                      tempat_lahir = value;
                      // print('Nilai berubah: $value');
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
                        text: profile1.tanggal_lahir), // Isi dengan nilai awal
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: "contoh data: 2006-01-01",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffcddeec)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffcddeec)),
                      ),
                    ),
                    onChanged: (value) {
                      // Fungsi yang akan dijalankan ketika teks berubah
                      tanggal_lahir = value;
                      // print('Nilai berubah: $value');
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
                        text: profile1.telpon_orangtua), // Isi dengan nilai awal
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
                      telpon_orangtua = value;
                      // print('Nilai berubah: $value');
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
                        text: profile1.alamat), // Isi dengan nilai awal
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
                      alamat = value;
                      // print('Nilai berubah: $value');
                      // Tambahkan logika atau manipulasi data yang sesuai di sini
                    },
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Profile_Api().postProfile(user1.username, profile1.id, nama, telpon, email, tempat_lahir, tanggal_lahir, telpon_orangtua, alamat).then((value) {
                          print(value);
                          Navigator.pop(context);
                        });
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
