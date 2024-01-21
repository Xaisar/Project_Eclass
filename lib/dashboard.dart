import 'package:flutter/material.dart';
import 'package:mobile_eclass/api/dashboard_api.dart';
import 'package:mobile_eclass/constant/const.dart';
// import 'package:mobile_eclass/dashboard.dart';
import 'package:mobile_eclass/detail.dart';
import 'package:mobile_eclass/model/class_group.dart';
import 'package:mobile_eclass/model/course_model.dart';
import 'package:mobile_eclass/model/siswa_model.dart';
import 'package:mobile_eclass/model/study_year_model.dart';
import 'package:mobile_eclass/model/teacher_model.dart';
import 'package:mobile_eclass/notification.dart';
import 'package:mobile_eclass/services/profile.dart';
import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:mobile_eclass/login.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:mobile_eclass/model/siswa_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;


// Future<List<Siswa>> fetchSiswa() async {
//   final response = await http.get(Uri.parse(
//       '$url/student/classes2'));
//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//     return parsed.map<Siswa>((json) => Siswa.fromMap(json)).toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }


// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  final String argument1;
  // DashboardPage({Key? key}) : super(key: key);
  DashboardPage({required this.argument1 ,Key? key}): super(key: key);
  // print(argument1);
  // late String argument;
  // public();

  @override
  State<DashboardPage> createState() => _DashboardPageState(username: argument1);
}

class _DashboardPageState extends State<DashboardPage> {
  // late Future<List<Siswa>> futurePost;
  
  final String username;
  _DashboardPageState({required this.username});

  Siswa _user = Siswa(token: '',id: '', name: '',username: '' ,picture: '');
  List<Course> _course=[Course(id: '', semester: "", thumbnail: "", number_of_meetings: "", description: "", study_year: StudyYear(id: "", year: "", semester: ""), class_group: ClassGroup(id: "", name: "", code: ""), subject: Subject(id: "", code: "", name: "", grade: "",),teacher: Teacher(email: "",name: "",id: "",identity_number: ""))];
   
  var _loading = false;

  Future<Null> _isiData()async{
    setState(() {
      _loading = true;
    });
    // print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    // final responses = await http.post("http://192.168.100.15:8000/api/student/classes2",headers: {"Content-Type": "apllication/json"},{"username"})
    
    Dashboard_Api().getDashboard(username).then((response) {
      // print(jsonDecode(response).toString());
      // final Map<String,dynamic> data = json.decode(response.body);
      // final data = json.decode(response);
      // print(response);
      // String a = response['user']['name'];
      // print(a);
      // var a = data['user'];
      // print(a['name'].toString());
      // _user = Siswa(name: a['name'], token: a['token'], picture: a['picture']);  
      setState(() {
        _course.clear();
        _user = Siswa.fromJson(response['user']);

        // print(_user.username);
        for(Map<String,dynamic> x in response['courses']){
          // print(x);
          _course.add(Course.fromJson(x));
        };
        // print(_course);
        _loading = false;
      });
    });   
  }

  @override
  void initState() {
    super.initState();
    // futurePost = fetchSiswa();
    _isiData();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    int  panjang = _course.length;
    // int i pilih dan isi angka 1 - (jumlah course) untuk ganti course
    int i = 1;

    return Material(
        child: 
        _loading? Center(child: CircularProgressIndicator()):
        Container(
            // home1LcR (260:585)
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff000000)),
              color: const Color(0xffffffff),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                // autogroupgyqsGFB (J8esxsAYBvLnYUkeQDgYQs)
                // margin:
                //     EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 33 * fem),
                // width: double.infinity,
                // height: 241 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // rectangle16yQV (260:586)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 360 * fem,
                          height: 191 * fem,
                          child: Image.asset(
                            'assets/image/Rectangle_16.png',
                            width: 360 * fem,
                            height: 191 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // hihvanicedaysEy (260:587)
                      left: 30 * fem,
                      top: 63 * fem,
                      child: SizedBox(
                        width: 146 * fem,
                        height: 46 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              // hikageyamancq (260:588)
                              child: Text(
                                'Hi, '+ _user.name +'!',
                                style: TextStyle(
                                  fontFamily: 'Work Sans',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 0.6 * fem,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              // haveanicedaytvm (260:589)
                              'Have a nice day!',
                              style: TextStyle(
                                fontFamily: 'Work Sans',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w300,
                                height: 1.1725 * ffem / fem,
                                letterSpacing: 0.42 * fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // iconmoonoutlineRfo (260:590)
                      left: 302 * fem,
                      top: 63 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 28 * fem,
                          height: 28 * fem,
                          child: Image.asset(
                            'assets/image/icon_moon.png',
                            width: 28 * fem,
                            height: 28 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30 * fem,
                      top: 141 * fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            24 * fem, 20 * fem, 30 * fem, 17 * fem),
                        width: 300 * fem,
                        height: 100 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xfff3ad1b),
                          borderRadius: BorderRadius.circular(10 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x3f000000),
                              offset: Offset(0 * fem, 7 * fem),
                              blurRadius: 4 * fem,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              // margin: EdgeInsets.fromLTRB(
                              //     0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              // width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // profile6QZ (260:595)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                    width: 40,
                                    height: 40,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: OvalBorder(),
                                    ),
                                    child: Image.asset(
                                      'assets/image/profile.png',
                                      width: 18.48,
                                      height: 8.60,
                                    ),
                                  ),
                                  Container(
                                    // autogroupszkyQRF (J8etGC11DNJmxMNWRPsZKy)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          // kelasxucma1YGZ (260:598)
                                          // margin: EdgeInsets.fromLTRB(0 * fem,
                                          //     0 * fem, 0 * fem, 6 * fem),
                                          child: Text(
                                            'Kelas X ' + _course[i].class_group.code,
                                            style: TextStyle(
                                              fontFamily: 'Work Sans',
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.1725 * ffem / fem,
                                              color: const Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // semesterganjil20222023GCZ (260:599)
                                          'Semester ' + _course[i].semester + ' | ' + _course[i].study_year.year,
                                          style: TextStyle(
                                            fontFamily: 'Work Sans',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1725 * ffem / fem,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // autogrouput7mPY5 (J8etPMTjcqDUyrfZpBut7M)
                              margin: EdgeInsets.fromLTRB(
                                  53 * fem, 0 * fem, 81 * fem, 0 * fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // iconlylightoutlinepaper7DB (260:600)
                                    margin: EdgeInsets.fromLTRB(0 * fem,
                                        0.33 * fem, 7.63 * fem, 0 * fem),
                                    width: 11.37 * fem,
                                    height: 13.24 * fem,
                                    child: Image.asset(
                                      'assets/image/paper.png',
                                      width: 11.37 * fem,
                                      height: 13.24 * fem,
                                    ),
                                  ),
                                  Text(
                                    // matapelajarancQq (260:601)
                                    panjang.toString() + ' Mata Pelajaran',
                                    style: TextStyle(
                                      fontFamily: 'Work Sans',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w300,
                                      height: 1.1725 * ffem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 14 * fem),
                child: Text(
                  'Daftar Kelas',
                  style: TextStyle(
                    fontFamily: 'Work Sans',
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.1725 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // cardkelasrKB (260:603)
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 20 * fem, 5 * fem),
                padding:
                    EdgeInsets.fromLTRB(8 * fem, 8 * fem, 8 * fem, 20 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff719ec2)),
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // gambarj85 (260:625)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 20 * fem),
                      padding: EdgeInsets.fromLTRB(
                          22.25 * fem, 14 * fem, 21 * fem, 14.97 * fem),
                      width: 304 * fem,
                      height: 202 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(9.6428565979 * fem),
                      ),
                      child: SizedBox(
                        // gambarRFo (260:627)
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // ellipse1mKf (I260:627;1103:33)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 100 * fem, 13 * fem),
                              width: 40.66 * fem,
                              height: 39.38 * fem,
                              child: Image.asset(
                                'assets/image/Ellipse 1.png',
                                width: 40.66 * fem,
                                height: 39.38 * fem,
                              ),
                            ),
                            SizedBox(
                              // vector1UE5 (I260:627;1103:32)
                              width: 100 * fem,
                              height: 100 * fem,
                              child: Image.asset(
                                'assets/image/Vector 1.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // fisikaQ7j (260:624)
                      margin: EdgeInsets.fromLTRB(
                          12 * fem, 0 * fem, 0 * fem, 5 * fem),
                      child: Text(
                        _course[i].subject.name,
                        style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.1725 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // ucmxa1Jiu (260:623)
                      margin: EdgeInsets.fromLTRB(
                          12 * fem, 0 * fem, 0 * fem, 5 * fem),
                      child: Text(
                        _course[i].class_group.code,
                        style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.1725 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // autogroup6wdmR2q (J8euG5WDSHtDKHLm2Z6wdM)
                      margin: EdgeInsets.fromLTRB(
                          12.67 * fem, 0 * fem, 0 * fem, 19 * fem),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // iconlylightoutlinechartLvV (260:622)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 7 * fem, 1.33 * fem),
                            width: 14.33 * fem,
                            height: 14.33 * fem,
                            child: Image.asset(
                              'assets/image/outline.png',
                              width: 14.33 * fem,
                              height: 14.33 * fem,
                            ),
                          ),
                          Container(
                            // kompetensideh (260:621)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 15 * fem, 0 * fem),
                            child: Text(
                              '0 Kompetensi',
                              style: TextStyle(
                                fontFamily: 'Work Sans',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w300,
                                height: 1.1725 * ffem / fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // iconlylightvideojxd (260:617)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 6 * fem, 1 * fem),
                            width: 19 * fem,
                            height: 14 * fem,
                            child: Image.asset(
                              'assets/image/video.png',
                              width: 19 * fem,
                              height: 14 * fem,
                            ),
                          ),
                          Text(
                            // pertemuanrnM (260:616)
                            _course[i].number_of_meetings +' Pertemuan',
                            style: TextStyle(
                              fontFamily: 'Work Sans',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.1725 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage(id: _course[i].id, siswa: _user)),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            12 * fem, 0 * fem, 12 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            86.83 * fem, 6 * fem, 85 * fem, 6 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff0a5896),
                          borderRadius: BorderRadius.circular(5 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 7.84 * fem, 0.17 * fem),
                              width: 12.33 * fem,
                              height: 12.16 * fem,
                              child: Image.asset(
                                'assets/image/bag.png',
                                width: 12.33 * fem,
                                height: 12.16 * fem,
                              ),
                            ),
                            Text(
                              'Detail Kelas',
                              style: TextStyle(
                                fontFamily: 'Work Sans',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.1725 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // autogrouprzzbY2u (J8etZvzSf7MBLHiW4HrZzB)
                width: double.infinity,
                height: 104 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // gesergeserguo (260:628)
                      left: 122 * fem,
                      top: 10 * fem,
                      child: Container(
                        width: 118 * fem,
                        height: 3 * fem,
                        decoration: const BoxDecoration(
                          color: Color(0xffd9d9d9),
                        ),
                        child: Align(
                          // rectangle13D93 (260:630)
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 32 * fem,
                            height: 3 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff0a5896),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // navbarLDf (260:631)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: SizedBox(
                        width: 360 * fem,
                        height: 104 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle11TJH (260:632)
                              left: 0 * fem,
                              top: 36 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 360 * fem,
                                  height: 68 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(4 * fem, 0 * fem),
                                          blurRadius: 2 * fem,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // fitur3koB (260:633)
                              left: 144 * fem,
                              top: 0 * fem,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    3 * fem, 3 * fem, 3 * fem, 3 * fem),
                                width: 72 * fem,
                                height: 72 * fem,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(36 * fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x3f000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 2 * fem,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  // ellipse32kh (260:635)
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 66 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(33 * fem),
                                        color: const Color(0xff2067a0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20 * fem,
                              top: 53 * fem,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigasi ke DashboardPage
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           DashboardPage(argument: argument)),
                                  // );
                                },
                                child: Container(
                                  width: 38 * fem,
                                  height: 43 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.home,
                                        size: 25.0,
                                        color: Color(0xfff3ad1b),
                                      ),
                                      Text(
                                        'Home',
                                        style: TextStyle(
                                          fontFamily: 'Work Sans',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1725 * ffem / fem,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 83 * fem,
                              top: 53 * fem,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigasi ke DashboardPage
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Notif(siswa: _user,)),
                                  );
                                },
                                child: Container(
                                  width: 38 * fem,
                                  height: 43 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.notification_add,
                                        size: 25.0,
                                        color: Color(0xfff3ad1b),
                                      ),
                                      Text(
                                        'Notif',
                                        style: TextStyle(
                                          fontFamily: 'Work Sans',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1725 * ffem / fem,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 240 * fem,
                              top: 53 * fem,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigasi ke MyProfile
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyProfile(argument1: _user)),
                                  );
                                },
                                child: Container(
                                  width: 38 * fem,
                                  height: 43 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        size: 28.0,
                                        color: Color(0xfff3ad1b),
                                      ),
                                      Text(
                                        'Profile',
                                        style: TextStyle(
                                          fontFamily: 'Work Sans',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1725 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // fitur5tiM (260:645)
                              left: 302 * fem,
                              top: 53 * fem,
                              child: Container(
                                width: 38 * fem,
                                height: 43 * fem,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Hapus Container yang sebelumnya menunjukkan kotak
                                    const Icon(
                                      Icons
                                          .videocam, // Ganti dengan ikon notifikasi yang diinginkan
                                      size:
                                          25.0, // Sesuaikan ukuran ikon sesuai kebutuhan
                                      color: Color(0xfff3ad1b),
                                    ),
                                    Text(
                                      // loremvf3 (260:647)
                                      'Class',
                                      style: TextStyle(
                                        fontFamily: 'Work Sans',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
