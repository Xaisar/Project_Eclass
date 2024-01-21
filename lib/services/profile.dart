import 'package:flutter/material.dart';
import 'package:mobile_eclass/api/profil_api.dart';
import 'package:mobile_eclass/model/profile_model.dart';
import 'package:mobile_eclass/model/siswa_model.dart';
import 'editProfile.dart';
import 'editPassword.dart';
import 'package:mobile_eclass/dashboard.dart';

class MyProfile extends StatefulWidget{
  Siswa argument1;
  MyProfile({required this.argument1 ,Key? key}): super(key: key);

  @override
  State<MyProfile> createState() => _MyProfile(user: argument1);
}

class _MyProfile extends State<MyProfile>{
  Siswa user;
  _MyProfile({required this.user});

  Profile _profile = Profile(id: "", nisn: '',nama: '',alamat: '', telpon: '', email: '', gender: '', tempat_lahir: '', tanggal_lahir: '', telpon_orangtua: '');

  var _loading = false;

  Future<Null> _isiData()async{
    setState(() {
      _loading = true;
      // print(user.username);
    });

    Profile_Api().getProfile(user.username).then((response) {
      print(response.toString());
      setState(() {
        _profile = Profile.fromJson(response['profil']);
        _loading = false;
      });
    }); 
  }

  @override
  void initState(){
    super.initState();
    _isiData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => DashboardPage()),
                //   );
                // },
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
                        'Profile',
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 24,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: 
        _loading? Center(child: CircularProgressIndicator()) : 
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
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
                          color: Color(0xff383636),
                          size: 140,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _profile.nama,
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
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile(user: user,profile: _profile)),
                    );
                  },
                  child: Container(
                    width: 280,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0x00857676),
                      border: Border.all(width: 0.50, color: Color(0xFF0A5896)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          color: Color(0xFFF3AD1B),
                          size: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Ganti Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF0A5896),
                            fontSize: 15,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPassword(user: user)),
                    );
                  },
                  child: Container(
                    width: 280,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0x00857676),
                      border: Border.all(width: 0.50, color: Color(0xFF0A5896)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          color: Color(0xFFF3AD1B),
                          size: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Ganti Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF0A5896),
                            fontSize: 15,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
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
                  Text(
                    'NIS/NISN',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.nisn,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Nama',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.nama,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Nomor Telepon',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.telpon,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'E-mail',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.email,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Jenis Kelamin',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.gender,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Tempat Lahir',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.tempat_lahir,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Tanggal Lahir',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.tanggal_lahir,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'No. Telp Orang Tua',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.telpon_orangtua,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                   SizedBox(height: 30),
                  Text(
                    'alamat',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _profile.alamat,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 16,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 15),
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
