import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_eclass/absen.dart';
import 'package:mobile_eclass/api/detailKelas_api.dart';
// import 'package:mobile_eclass/login.dart';
import 'package:mobile_eclass/dashboard.dart';
import 'package:mobile_eclass/conference_room.dart';
import 'package:mobile_eclass/model/Assigment_model.dart';
import 'package:mobile_eclass/model/Meet_model.dart';
import 'package:mobile_eclass/model/Pelajaran_model.dart';
import 'package:mobile_eclass/model/class_group.dart';
import 'package:mobile_eclass/model/course_model.dart';
import 'package:mobile_eclass/model/kehadiran_model.dart';
import 'package:mobile_eclass/model/profile_model.dart';
import 'package:mobile_eclass/model/siswa_model.dart';
import 'package:mobile_eclass/model/study_year_model.dart';
import 'package:mobile_eclass/model/teacher_model.dart';
import 'package:mobile_eclass/services/upload.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final String id;
  Siswa siswa;
  DetailPage({required this.id, required this.siswa, Key? key}): super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState(userid: id, user: siswa);
}

class _DetailPageState extends State<DetailPage> {
  final String userid;
  Siswa user;
  _DetailPageState({required this.userid, required this.user});
  int absensi = 0;

  var _loading = false;

  Course _course = Course(id: '', semester: "", thumbnail: "", number_of_meetings: "", description: "", study_year: StudyYear(id: "", year: "", semester: ""), class_group: ClassGroup(id: "", name: "", code: ""), subject: Subject(id: "", code: "", name: "", grade: "",),teacher: Teacher(email: "",name: "",id: "",identity_number: "")) ;
  Profile _student = Profile(id: '', nisn: '', nama: '', telpon: '', email: '', gender: '', tempat_lahir: '', tanggal_lahir: '', telpon_orangtua: '');
  List<Kehadiran> kehadiran_present = [];
  List<Kehadiran> kehadiran_absent = [];
  List<Pelajaran> pelajaran =[];
  List<Assignment> tp = [];
  List<Assignment> tk = [];
  List<Meet> meet = [];
  int groupValue = 2;
  List<String> type = ["file", "link"];
  String link = "";

  Future<Null> _isiData()async{
    setState((){
      _loading = true;
    });
    print(userid);
    DetailKelas_Api().getDetailKelas(userid, user.username).then((response){
      setState(() {
        _course = Course.fromJson(response["courses"]);
        _student = Profile.fromJson(response["student"]);
        if (response["kehadiran_present"] != null){
          for(Map<String,dynamic> x in response['kehadiran_present']){
          // print(x);
          kehadiran_present.add(Kehadiran.fromJson(x));
        };
        };
        if (response["kehadiran_absent"] != null){
          for(Map<String,dynamic> x in response['kehadiran_absent']){
          // print(x);
          kehadiran_absent.add(Kehadiran.fromJson(x));
          };
        };
        if (response["courses"]["basic_comptence"] != null){
          for(Map<String,dynamic> x in response["courses"]["basic_comptence"] ){
          // print(x);
          pelajaran.add(Pelajaran.fromJson(x));
          };
        };
        if (response["courses"]["video_conference"] != null){
          for(Map<String,dynamic> x in response["courses"]["video_conference"] ){
          // print(x);
          meet.add(Meet.fromJson(x));
          };
        };
         if (response["tugas_pengetahuan"] != null){
          for(Map<String,dynamic> x in response["tugas_pengetahuan"]){
          // print(x);
          tp.add(Assignment.fromJson(x));
          };
        };
        if (response["tugas_keterampilan"] != null){
          for(Map<String,dynamic> x in response["tugas_keterampilan"]){
          // print(x);
          tk.add(Assignment.fromJson(x));
          };
        };
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
                        'e-class',
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
        // _loading? Center(child: CircularProgressIndicator()):
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical:15),
                // width: 320,
                // height: 176,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 0.50, color: Color(0xFF719EC2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // alignment: Alignment.center,
                  children: [
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(left:10,right:10,bottom:15),
                        decoration: const ShapeDecoration(
                          shape: Border(
                            bottom: BorderSide(width: 1, color: Color(0xFF719EC2))
                          )
                        ),
                        child: const Text(
                            'Detail Kelas',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 24,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight
                                  .w700, // Set FontWeight to w700 for bold
                              height: 0,
                            ),
                          ),
                      ),
                      // ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                                margin: const EdgeInsets.only(left: 10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(
                                      0xFFD9D9D9), // Change the color as needed
                                ),
                                padding: const EdgeInsets.all(
                                    7), // Adjust padding as needed
                                child: const Icon(
                                  Icons.person_outline,
                                  color: Color(
                                      0xff221f1f), // Change the color as needed
                                  size: 50, // Adjust the size of the person icon
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                _course.teacher.name ,
                                style: TextStyle(
                                  color: Color(0xFF0A5896),
                                  fontSize: 20,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    _course.subject.name,
                                    style: TextStyle(
                                      color: Color(0xFF0A5896),
                                      fontSize: 20,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          6), // Adjust the space between text and container
                                  Container(
                                    width: 90,
                                    height: 19,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFF3AD1B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Semester ' + _course.semester,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    )),
                                  ),
                                  // const SizedBox(width: 6, height: 6),
                                  // Container(
                                  //   width: 60,
                                  //   height: 19,
                                  //   decoration: ShapeDecoration(
                                  //     color: Color(0xFFF3AD1B),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(3),
                                  //     ),
                                  //   ),
                                  //   child: const Center(
                                  //       child: Text(
                                  //     'KKM : 75',
                                  //     style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 12,
                                  //       fontFamily: 'Work Sans',
                                  //       fontWeight: FontWeight.w400,
                                  //       height: 0,
                                  //     ),
                                  //   )),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Kelas 10 ' + _course.class_group.name,
                                style: TextStyle(
                                  color: Color(0xFF0A5896),
                                  fontSize: 16,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                                ],
                              )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: Get.width,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  left: 20), // Tambahkan margin pada sisi kiri
                child: const Text(
                  'Status Kehadiran',
                  style: TextStyle(
                    color: Color(0xFF0A5896),
                    fontSize: 20,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    ),
                        textAlign: TextAlign.left,
                      ),
                    ),
              const SizedBox(height: 15),
              Container(
                width: 320,
                height: 271,
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
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: const Offset(
                        20, // Sesuaikan posisi horizontal jika diperlukan
                        20, // Sesuaikan posisi vertikal jika diperlukan
                      ),
                      child: const Text(
                        'Hari',
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 16,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(
                        5, // Sesuaikan posisi horizontal jika diperlukan
                        30, // Sesuaikan posisi vertikal jika diperlukan
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        spacing: 1,
                        runSpacing: 10,
                        children: List.generate(
                          30,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                // Aksi saat angka diklik
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF0A5896),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Work Sans',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: Get.width * 0.4,
                    child: const Text(
                        'Total Pertemuan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 15,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width* 0.475,
                    child: Text(
                        ': ' + _course.number_of_meetings +' Pertemuan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 15,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: Get.width * 0.4,
                    child: const Text(
                        'Total Kehadiran',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 15,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width* 0.475,
                    child: Text(
                        ': '+ kehadiran_present.length.toString() + ' Pertemuan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 15,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: Get.width * 0.4,
                    child: const Text(
                        'Total Ketidakhadiran',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 15,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width* 0.475,
                    child: Text(
                        ': ' + kehadiran_absent.length.toString()  + ' Pertemuan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 15,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: Get.width * 0.4,
                    child: const Text(
                        'keterangan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 15,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width* 0.475,
                    child: const Text(
                        ': ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 15,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: Get.width,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Container(
                            height: Get.height * 0.4,
                            //ganti nilai height jika ada overflow di tampilan
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            padding: EdgeInsets.all(20),
                             decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                        width: 0.50, color: Color(0xFF719EC2)),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, 
                                      icon: Icon(Icons.arrow_back_ios, color: Colors.red,)),
                                    Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                                'Pilih Nomor Pertemuan',
                                                style: TextStyle(
                                                  color: Color(0xFF0A5896),
                                                              fontSize: 20,
                                                              fontFamily: 'Work Sans',
                                                              fontWeight: FontWeight.w600,
                                                              height: 0,
                                                  ),
                                              ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceEvenly,
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: List.generate(
                                    16,
                                    (index) {
                                  return GestureDetector(
                                    onTap: () {
                                     absensi = index + 1;
                                     print(absensi);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF0A5896),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Work Sans',
                                        ),
                                      ),
                                    ),
                                  );
                                                              },
                                                            ),
                                                          ),
                                ),
                                SizedBox(height: 25),
                                 Container(
                              width: Get.width,
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  DetailKelas_Api().postKehadiran(_course.id, _student.id, absensi).then((value) {
                                    print(value);
                                    Navigator.pop(context);
                                    });
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0A5896), // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const SizedBox(
                                  width: 80,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      'Presensi',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const AbsenPage(),
                    //   ),
                    // );
                    // Add login button logic
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0A5896), // Background color
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Container(
                    width: 200,
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      'Presensi Sekarang',
                      style: TextStyle(color:Colors.white,fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: Get.width,
                alignment: Alignment.center, // Tambahkan margin pada sisi kiri
                child: const Text(
                  'Jadwal Video Conference',
                  style: TextStyle(
                    color: Color(0xFF0A5896),
                      fontSize: 20,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                )),              
              const SizedBox(height: 15),
              meet.length == 0? 
              Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                            "Tidak ada Jadwal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 20,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
              ):
              Column(
                children: List.generate(
                          meet.length,
                          (index) {
                            return 
                            Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            meet[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 20,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.folder,
                              color: Color(0xfff9c944),
                              size: 20,
                            ),
                            SizedBox(
                                width:
                                    10), // Add space between the icon and text
                            Text(
                              'Pertemuan ke-' + meet[index].meeting_number,
                              style: TextStyle(
                                color: Color(0xFF0A5896),
                                fontSize: 15,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                         const SizedBox(
                          height: 10,
                        ),
                         Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Color(0xfff9c944),
                              size: 20,
                            ),
                            Row(
                              children: [
                                // Your existing code
                                SizedBox(
                                  width:
                                      10, // Add space between the icon and text
                                ),
                                Text(
                                  meet[index].tanggal,
                                  style: TextStyle(
                                    color: Color(0xFF0A5896),
                                    fontSize: 15,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      5, // Add space between the date and the separator
                                ),
                                Text(
                                  '|',
                                  style: TextStyle(
                                    color: Color(0xFF0A5896),
                                    fontSize: 15,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      5, // Add space between the separator and the time
                                ),
                                Text(
                                  meet[index].waktu,
                                  style: TextStyle(
                                    color: Color(0xFF0A5896),
                                    fontSize: 15,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                                  height: 20, // Add space between the date and the separator
                                ),
                        Container(
                          width: Get.width,
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ConferenceRoom(profil: _student, meet: meet[index], course: _course), // Ganti dengan widget atau halaman yang diinginkan
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0A5896), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const SizedBox(
                              width: 80,
                              height: 30,
                              child: Center(
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  ])
              );
                          },
                        ),
              ),
              const SizedBox(height: 15),
              Container(
                    width: Get.width,
                    alignment: Alignment.center,// Tambahkan margin pada sisi kiri
                    child: const Text(
                      'Materi / Bahan Ajar',
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 20,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
              const SizedBox(height: 15),
              pelajaran.length == 0?
              Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.5, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ), child:Text(
                            "Tidak ada Pelajaran",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 20,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                  ):
              Container(
                  // width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.5, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ), child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(pelajaran.length, (index) => Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.picture_as_pdf,
                                  color: Color(0xfff10c0c),
                                )),
                            Flexible(
                              child: Text(
                                pelajaran[index].name,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            )
                          ],
                        ))
                  ),
              ),             
              const SizedBox(height: 30),
              Container(
                width: Get.width,
                alignment: Alignment.center,
                child: const Text(
                  'Tugas Pengetahuan',
                  style: TextStyle(
                    color: Color(0xFF0A5896),
                    fontSize: 20,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 340,
                height: 30,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0xffafbac3),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'search',
                        style: TextStyle(
                          color: Color(0x72719EC2),
                          fontSize: 16,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              tp.length == 0?
              Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                            "Tidak ada Tugas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 20,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
              ):
              Column(
                children: List.generate(tp.length, (index) {
                  return
                  Container(
                width: Get.width,
                // height: 127,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      alignment: Alignment.center,
                      child: Text(
                        tp[index].name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 16,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ), // Add space between 'Tugas 1' and the new text
                    Text(
                      'Start: ' + tp[index].date_start + ', ' + tp[index].time_start,
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 14,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w300,
                        height: 1.5, // Adjust line height as needed
                      ),// Enable automatic wrapping of text
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,// Set the maximum number of lines
                    ),
                     const SizedBox(
                      height: 5,
                    ), // Add space between 'Tugas 1' and the new text
                    Text(
                      'End: ' + tp[index].date_end + ', ' + tp[index].time_end,
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 14,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w300,
                        height: 1.5, // Adjust line height as needed
                      ),// Enable automatic wrapping of text
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,// Set the maximum number of lines
                    ),                 
                    const SizedBox(
                        height: 10), // Adjust the height as needed               
                    Row(
                      children: [
                        Container(
                          width: 95,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF3AD1B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: const Center(
                            child: SizedBox(
                              width: 87,
                              child: Text(
                                'Belum Dikerjakan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Aksi yang akan dilakukan saat tombol ditekan
                            showDialog(
                      context: context,
                      builder: (BuildContext context) => Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Container(
                            height: Get.height * 0.45,
                            //ganti nilai height jika ada overflow di tampilan
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            padding: EdgeInsets.all(20),
                             decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                        width: 0.50, color: Color(0xFF719EC2)),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, 
                                      icon: Icon(Icons.arrow_back_ios, color: Colors.red,)),
                                    Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                                'Upload Tugas',
                                                style: TextStyle(
                                                  color: Color(0xFF0A5896),
                                                              fontSize: 20,
                                                              fontFamily: 'Work Sans',
                                                              fontWeight: FontWeight.w600,
                                                              height: 0,
                                                  ),
                                              ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25),
                                const Text(
                                                'Type',
                                                style: TextStyle(
                                                  color: Color(0xFF0A5896),
                                                              fontSize: 20,
                                                              fontFamily: 'Work Sans',
                                                              fontWeight: FontWeight.w600,
                                                              height: 0,
                                                  ),
                                              ),
                                SizedBox(height: 10),         
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    // Row(
                                    //   children: [
                                    //     Radio(value: 1, groupValue: groupValue, onChanged: (value){
                                    //       setState(() {
                                    //         groupValue = value;
                                    //       });
                                    //     }),
                                    //     Text(
                                    //   'File',
                                    //   style: TextStyle(
                                    //     color: Colors.black,
                                    //     fontSize: 14,
                                    //     fontFamily: 'Work Sans',
                                    //     fontWeight: FontWeight.w500,
                                    //     height: 0,
                                    //   ),
                                    // ),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Radio(value: 2, groupValue: groupValue, onChanged: (value){
                                          setState(() {
                                            groupValue = value as int;
                                            print(groupValue);
                                          });
                                        }),
                                        Text(
                                      'Link',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                      ],
                                    ),

                                  ]
                                ),
                                SizedBox(height: 25),
              TextField(
              decoration: InputDecoration(
                labelText: 'input link',
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
              onChanged: (value){
                link = value;
                print(link);
              },
            ),
                                SizedBox(height: 25),
                                 Container(
                              width: Get.width,
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  DetailKelas_Api().postTugasPengetahuan(tp[index].id, _student.id, type[groupValue-1], link, _course.subject.grade).then((value) {
                                    print(value);
                                    Navigator.pop(context);
                                    });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0A5896), // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const SizedBox(
                                  width: 80,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      'upoad',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                width: 95,
                                height: 20,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF3AD1B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(3),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(width: 6),
                                    SizedBox(
                                      width: 69,
                                      child: Text(
                                        'Input tugas',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
                }),
              ),
              const SizedBox(height: 15),
              Container(
                width: Get.width,
                alignment: Alignment.center,
                  child: const Text(
                    'Tugas Keterampilan',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 20,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
              )),
              const SizedBox(height: 15),
              Container(
                width: 340,
                height: 30,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0xffafbac3),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'search',
                        style: TextStyle(
                          color: Color(0x72719EC2),
                          fontSize: 16,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              tk.length == 0?
              Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                            "Tidak ada Tugas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 20,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
              ):
              Column(
                children: List.generate(tp.length, (index) {
                  return
                  Container(
                width: Get.width,
                // height: 127,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      alignment: Alignment.center,
                      child: Text(
                        tk[index].name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xFF0A5896),
                          fontSize: 16,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ), // Add space between 'Tugas 1' and the new text
                    Text(
                      'Start: ' + tk[index].date_start + ', ' + tk[index].time_start,
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 14,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w300,
                        height: 1.5, // Adjust line height as needed
                      ),// Enable automatic wrapping of text
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,// Set the maximum number of lines
                    ),
                     const SizedBox(
                      height: 5,
                    ), // Add space between 'Tugas 1' and the new text
                    Text(
                      'End: ' + tk[index].date_end + ', ' + tk[index].time_end,
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 14,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w300,
                        height: 1.5, // Adjust line height as needed
                      ),// Enable automatic wrapping of text
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,// Set the maximum number of lines
                    ),                 
                    const SizedBox(
                        height: 10), // Adjust the height as needed               
                    Row(
                      children: [
                        Container(
                          width: 95,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF3AD1B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: const Center(
                            child: SizedBox(
                              width: 87,
                              child: Text(
                                'Belum Dikerjakan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Aksi yang akan dilakukan saat tombol ditekan
                            showDialog(
                      context: context,
                      builder: (BuildContext context) => Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Container(
                            height: Get.height * 0.45,
                            //ganti nilai height jika ada overflow di tampilan
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            padding: EdgeInsets.all(20),
                             decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                        width: 0.50, color: Color(0xFF719EC2)),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, 
                                      icon: Icon(Icons.arrow_back_ios, color: Colors.red,)),
                                    Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                                'Upload Tugas',
                                                style: TextStyle(
                                                  color: Color(0xFF0A5896),
                                                              fontSize: 20,
                                                              fontFamily: 'Work Sans',
                                                              fontWeight: FontWeight.w600,
                                                              height: 0,
                                                  ),
                                              ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25),
                                const Text(
                                                'Type',
                                                style: TextStyle(
                                                  color: Color(0xFF0A5896),
                                                              fontSize: 20,
                                                              fontFamily: 'Work Sans',
                                                              fontWeight: FontWeight.w600,
                                                              height: 0,
                                                  ),
                                              ),
                                SizedBox(height: 10),         
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    // Row(
                                    //   children: [
                                    //     Radio(value: 1, groupValue: groupValue, onChanged: (value){
                                    //       setState(() {
                                    //         groupValue = value;
                                    //       });
                                    //     }),
                                    //     Text(
                                    //   'File',
                                    //   style: TextStyle(
                                    //     color: Colors.black,
                                    //     fontSize: 14,
                                    //     fontFamily: 'Work Sans',
                                    //     fontWeight: FontWeight.w500,
                                    //     height: 0,
                                    //   ),
                                    // ),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Radio(value: 2, groupValue: groupValue, onChanged: (value){
                                          setState(() {
                                            groupValue = value as int;
                                            print(groupValue);
                                          });
                                        }),
                                        Text(
                                      'Link',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                      ],
                                    ),

                                  ]
                                ),
                                SizedBox(height: 25),
              TextField(
              decoration: InputDecoration(
                labelText: 'input link',
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
              onChanged: (value){
                link = value;
                print(link);
              },
            ),
                                SizedBox(height: 25),
                                 Container(
                              width: Get.width,
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  DetailKelas_Api().postTugasKeterampilan(tk[index].id, _student.id, type[groupValue-1], link, _course.subject.grade).then((value) {
                                    print(value);
                                    Navigator.pop(context);
                                    });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0A5896), // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const SizedBox(
                                  width: 80,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      'upoad',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                width: 95,
                                height: 20,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF3AD1B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(3),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(width: 6),
                                    SizedBox(
                                      width: 69,
                                      child: Text(
                                        'Input tugas',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
                }),
              ),
              
              SizedBox(height: 15)

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
