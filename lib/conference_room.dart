import 'package:flutter/material.dart';
// import 'package:mobile_eclass/dashboard.dart';
import 'package:mobile_eclass/detail.dart';
import 'package:get/get.dart';
import 'package:mobile_eclass/model/Meet_model.dart';
import 'package:mobile_eclass/model/course_model.dart';
import 'package:mobile_eclass/model/profile_model.dart';
import 'package:url_launcher/url_launcher.dart';


class ConferenceRoom extends StatefulWidget {
  Profile profil;
  Meet meet;
  Course course;

  ConferenceRoom({Key? key, required this.profil, required this.meet, required this.course}) : super(key: key);

  @override
  State<ConferenceRoom> createState() => _ConferenceRoomState(profil1: profil, meet2: meet, course3: course);
}

class _ConferenceRoomState extends State<ConferenceRoom> {
  Profile profil1;
  Meet meet2;
  Course course3;

  

  _ConferenceRoomState({required this.profil1, required this.meet2, required this.course3});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Conference Room',
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
      body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.5, color: Color(0xFF719EC2)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    meet2.name,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 20,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Kode Meeting : '+ meet2.code,
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 20,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(children: <Widget>[
                Container(
                  width: Get.width,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: CircleBorder(),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 100, // Ukuran ikon
                          color: Colors.black, // Warna ikon
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Join Meeting',
                  style: TextStyle(
                    color: Color(0xFF0A5896),
                    fontSize: 20,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'X ' + course3.class_group.name +' | '+ course3.subject.name,
                  style: TextStyle(
                    color: Color(0xFF0A5896),
                    fontSize: 20,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: Get.width, // Panjang TextField // Lebar TextField
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: profil1.nama,
                      labelStyle: const TextStyle(
                        color: Color(
                            0xFF0A5896), // Memberi warna biru pada labelText
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    style: const TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 16,
                      // Ganti dengan nama font Work Sans yang sesuai
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: (){
                    _launcerUrl(meet2.code);
                  },
                  child: Container(
                    width: Get.width,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0A5896),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Join Meeting',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w600,
                        height: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launcerUrl(String code) async{
  Uri _url = Uri.parse('https://us04web.zoom.us/j/$code?');
  print(_url.toString());
  if (!await launchUrl(_url,mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_url');
  }
}