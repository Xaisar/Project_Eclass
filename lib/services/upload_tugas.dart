import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_eclass/model/course_model.dart';
import 'package:mobile_eclass/model/profile_model.dart';

class UploadTugasPage extends StatefulWidget{
  Course course;
  Profile student;

  UploadTugasPage({required this.course, required this.student});

  @override
  State<UploadTugasPage> createState() => _UploadTugasPageState(course1: course, student1: student); 
}

class _UploadTugasPageState extends State<UploadTugasPage>{
  int? groupValue = 1;
  Course course1;
  Profile student1;
  _UploadTugasPageState({required this.course1, required this.student1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    Row(
                                      children: [
                                        Radio(value: 1, groupValue: groupValue, onChanged: (value){
                                          setState(() {
                                            groupValue = value;
                                            print(groupValue);
                                          });
                                        }),
                                        Text(
                                      'File',
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
                                    Row(
                                      children: [
                                        Radio(value: 2, groupValue: groupValue, onChanged: (value){
                                          setState(() {
                                            groupValue = value;
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
                                    )
                                  ]
                                ),
                                SizedBox(height: 25),
                                 Container(
                              width: Get.width,
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  // DetailKelas_Api().postKehadiran(_course.id, _student.id, absensi).then((value) {
                                  //   print(value);
                                  //   Navigator.pop(context);
                                  //   });
                                  
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
                      );
  }

}