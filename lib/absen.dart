import 'package:flutter/material.dart';
import 'package:mobile_eclass/dashboard.dart';
import 'package:mobile_eclass/conference_room.dart';
import 'package:mobile_eclass/detail.dart';

class AbsenPage extends StatefulWidget {
  const AbsenPage({Key? key}) : super(key: key);

  @override
  State<AbsenPage> createState() => _AbsenPageState();
}

class _AbsenPageState extends State<AbsenPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Opacity(
          opacity: 0.5,
          child: SingleChildScrollView(
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
                          'e-class',
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
                    //   MaterialPageRoute(builder: (context) => DashboardPage()),
                    // );
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF0A5896),
                    size: 25,
                    semanticLabel: 'Back',
                  ),
                ),
                SizedBox(height: 15),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 320,
                      height: 176,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Positioned(
                      top: 65,
                      child: Container(
                        width: 320,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF719EC2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: -20,
                      child: Transform.translate(
                        offset: Offset(35, 0),
                        child: Text(
                          'Detail Kelas',
                          style: TextStyle(
                            color: Color(0xFF0A5896),
                            fontSize: 24,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 95,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: Offset(-5, -4),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFD9D9D9),
                              ),
                              padding: EdgeInsets.all(7),
                              child: Icon(
                                Icons.person_outline,
                                color: Color(0xff221f1f),
                                size: 50,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama Guru',
                                style: TextStyle(
                                  color: Color(0xFF0A5896),
                                  fontSize: 20,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    'Fisika',
                                    style: TextStyle(
                                      color: Color(0xFF0A5896),
                                      fontSize: 20,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(width: 6),
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
                                        'Semester Ganjil',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Container(
                                    width: 60,
                                    height: 19,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFF3AD1B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'KKM : 75',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Kelas 10 UCM-A1',
                                style: TextStyle(
                                  color: Color(0xFF0A5896),
                                  fontSize: 16,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20), // Tambahkan margin pada sisi kiri
                        child: Text(
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
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: 320,
                  height: 271,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
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
                        offset: Offset(
                          20, // Sesuaikan posisi horizontal jika diperlukan
                          20, // Sesuaikan posisi vertikal jika diperlukan
                        ),
                        child: Text(
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
                        offset: Offset(
                          20, // Sesuaikan posisi horizontal jika diperlukan
                          30, // Sesuaikan posisi vertikal jika diperlukan
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => DetailPage()),
                                // );
                                // Aksi saat ikon silang diklik
                              },
                              child: Icon(
                                Icons.close,
                                color: Color(0xFF0A5896),
                                size: 28,
                              ),
                            ),
                            SizedBox(width: 10), // Jarak antara ikon dan teks
                            Text(
                              'Pilih Nomor Pertemuan',
                              style: TextStyle(
                                color: Color(0xFF0A5896),
                                fontSize: 20,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          10, // Sesuaikan posisi horizontal jika diperlukan
                          50, // Sesuaikan posisi vertikal jika diperlukan
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            5,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  // Aksi saat angka diklik
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
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
                      //SizedBox(height: 110),
                      Transform.translate(
                        offset: Offset(170,
                            170), // Adjust the offset to move the button to the right
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         DetailPage(), // Ganti dengan widget atau halaman yang diinginkan
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0A5896), // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Container(
                            width: 80,
                            height: 40,
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
                SizedBox(height: 40),
                Transform.translate(
                  offset: Offset(-8, 0),
                  child: Text(
                    'Total Pertemuan         :   16 Pertemuan',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 15,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Transform.translate(
                  offset: Offset(-8, 0),
                  child: Text(
                    'Total Kehadiran          :   3 Pertemuan',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 15,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Transform.translate(
                  offset: Offset(-8, 0),
                  child: Text(
                    'Total Ketidakhadiran  :   13 Pertemuan',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 15,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Transform.translate(
                  offset: Offset(-8,
                      0), // Sesuaikan nilai offset untuk memindahkan teks ke kanan
                  child: Text(
                    'Keterangan                :',
                    style: TextStyle(
                      color: Color(0xFF0A5896),
                      fontSize: 15,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AbsenPage(),
                      ),
                    );
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
                    child: Text(
                      'Presensi Sekarang',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 39),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 20), // Tambahkan margin pada sisi kiri
                          child: Text(
                            'Jadwal Video Conference',
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 20,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 0),
                Transform.translate(
                  offset: Offset(-8, 0),
                  child: Container(
                    width: 221,
                    height: 172,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.translate(
                          offset: Offset(20, 30),
                          child: Text(
                            'Uji Coba',
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 20,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Transform.translate(
                          offset: Offset(20, 0),
                          child: Row(
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
                                'Pertemuan ke-1',
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
                        ),
                        Transform.translate(
                          offset: Offset(20, 15),
                          child: Row(
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
                                    '11-10-2023',
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
                                    '08:59',
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
                        ),
                        SizedBox(height: 30),
                        Transform.translate(
                          offset: Offset(60,
                              0), // Adjust the offset to move the button to the right
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ConferenceRoom(), // Ganti dengan widget atau halaman yang diinginkan
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0A5896), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Container(
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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 33),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
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
                    ),
                  ],
                ),
                Container(
                  width: 340,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                SizedBox(height: 16),
                Container(
                  width: 320,
                  height: 127,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10), // Add some space between the texts
                      Transform.translate(
                        offset: Offset(20,
                            10), // Adjust the values to move up and to the left
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tugas 1',
                                  style: TextStyle(
                                    color: Color(0xFF0A5896),
                                    fontSize: 16,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ), // Adjust the space between text and container
                                Container(
                                  width: 65,
                                  height: 19,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF3AD1B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'penugasan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )),
                                ),
                                SizedBox(width: 8, height: 4),
                                Container(
                                  width: 30,
                                  height: 19,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF3AD1B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ph-2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ), // Add space between 'Tugas 1' and the new text
                            SizedBox(
                              width: 208,
                              child: Text(
                                'Rabu, 11 Oktober 2023 09.51 Sampai Rabu, 18 Oktober 2023, 18.06 ',
                                style: TextStyle(
                                  color: Color(0xFF0A5896),
                                  fontSize: 14,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w300,
                                  height: 1.5, // Adjust line height as needed
                                ),
                                softWrap:
                                    true, // Enable automatic wrapping of text
                                maxLines: 2, // Set the maximum number of lines
                              ),
                            ),

                            SizedBox(height: 10), // Adjust the height as needed

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
                                  child: Center(
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
                                SizedBox(
                                  width: 6,
                                ), // Add space between the two containers
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            10), // Add space between the icon and the text

                                    // Container 2 with text
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons
                                                .upload, // Replace with the desired icon
                                            color: Colors.white,
                                            size:
                                                18, // Adjust the size of the icon as needed
                                          ),
                                          SizedBox(
                                              width:
                                                  6), // Add space between the icon and the text
                                          SizedBox(
                                            width:
                                                69, // Adjust the width of the text container accordingly
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: 320,
                  height: 127,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10), // Add some space between the texts
                      Transform.translate(
                        offset: Offset(20,
                            10), // Adjust the values to move up and to the left
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tugas 2',
                                  style: TextStyle(
                                    color: Color(0xFF0A5896),
                                    fontSize: 16,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ), // Adjust the space between text and container
                                Container(
                                  width: 65,
                                  height: 19,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF3AD1B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'penugasan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )),
                                ),
                                SizedBox(width: 8, height: 4),
                                Container(
                                  width: 30,
                                  height: 19,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF3AD1B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ph-2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ), // Add space between 'Tugas 1' and the new text
                            SizedBox(
                              width: 208,
                              child: Text(
                                'Rabu, 11 Oktober 2023 09.51 Sampai Rabu, 18 Oktober 2023, 18.06 ',
                                style: TextStyle(
                                  color: Color(0xFF0A5896),
                                  fontSize: 14,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w300,
                                  height: 1.5, // Adjust line height as needed
                                ),
                                softWrap:
                                    true, // Enable automatic wrapping of text
                                maxLines: 2, // Set the maximum number of lines
                              ),
                            ),

                            SizedBox(height: 10), // Adjust the height as needed

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
                                  child: Center(
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
                                SizedBox(
                                  width: 6,
                                ), // Add space between the two containers
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            10), // Add space between the icon and the text

                                    // Container 2 with text
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons
                                                .upload, // Replace with the desired icon
                                            color: Colors.white,
                                            size:
                                                18, // Adjust the size of the icon as needed
                                          ),
                                          SizedBox(
                                              width:
                                                  6), // Add space between the icon and the text
                                          SizedBox(
                                            width:
                                                69, // Adjust the width of the text container accordingly
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 33),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Tugas Keterampilan',
                            style: TextStyle(
                              color: Color(0xFF0A5896),
                              fontSize: 20,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )),
                    ),
                  ],
                ),
                Container(
                  width: 340,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                SizedBox(height: 16),
                Container(
                  width: 320,
                  height: 127,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10), // Add some space between the texts
                      Transform.translate(
                        offset: Offset(20,
                            10), // Adjust the values to move up and to the left
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tugas 1',
                                  style: TextStyle(
                                    color: Color(0xFF0A5896),
                                    fontSize: 16,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ), // Adjust the space between text and container
                                Container(
                                  width: 65,
                                  height: 19,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF3AD1B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'penugasan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )),
                                ),
                                SizedBox(width: 8, height: 4),
                                Container(
                                  width: 30,
                                  height: 19,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF3AD1B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ph-2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ), // Add space between 'Tugas 1' and the new text
                            SizedBox(
                              width: 208,
                              child: Text(
                                'Rabu, 11 Oktober 2023 09.51 Sampai Rabu, 18 Oktober 2023, 18.06 ',
                                style: TextStyle(
                                  color: Color(0xFF0A5896),
                                  fontSize: 14,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w300,
                                  height: 1.5, // Adjust line height as needed
                                ),
                                softWrap:
                                    true, // Enable automatic wrapping of text
                                maxLines: 2, // Set the maximum number of lines
                              ),
                            ),
                            SizedBox(height: 10), // Adjust the height as needed
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
                                  child: Center(
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
                                SizedBox(
                                  width: 6,
                                ), // Add space between the two containers
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            10), // Add space between the icon and the text

                                    //Container 2 with text
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons
                                                .upload, // Replace with the desired icon
                                            color: Colors.white,
                                            size:
                                                18, // Adjust the size of the icon as needed
                                          ),
                                          SizedBox(
                                              width:
                                                  6), // Add space between the icon and the text
                                          SizedBox(
                                            width:
                                                69, // Adjust the width of the text container accordingly
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: 320,
                  height: 127,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF719EC2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10), // Add some space between the texts
                      Transform.translate(
                        offset: Offset(20,
                            10), // Adjust the values to move up and to the left
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tugas 2',
                                  style: TextStyle(
                                    color: Color(0xFF0A5896),
                                    fontSize: 16,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ), // Adjust the space between text and container
                                Container(
                                  width: 65,
                                  height: 19,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF3AD1B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'penugasan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )),
                                ),
                                SizedBox(width: 8, height: 4),
                                Container(
                                  width: 30,
                                  height: 19,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF3AD1B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ph-2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ), // Add space between 'Tugas 1' and the new text
                            SizedBox(
                              width: 208,
                              child: Text(
                                'Rabu, 11 Oktober 2023 09.51 Sampai Rabu, 18 Oktober 2023, 18.06 ',
                                style: TextStyle(
                                  color: Color(0xFF0A5896),
                                  fontSize: 14,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w300,
                                  height: 1.5, // Adjust line height as needed
                                ),
                                softWrap:
                                    true, // Enable automatic wrapping of text
                                maxLines: 2, // Set the maximum number of lines
                              ),
                            ),

                            SizedBox(height: 10), // Adjust the height as needed

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
                                  child: Center(
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
                                SizedBox(
                                  width: 6,
                                ), // Add space between the two containers
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            10), // Add space between the icon and the text

                                    // Container 2 with text
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons
                                                .upload, // Replace with the desired icon
                                            color: Colors.white,
                                            size:
                                                18, // Adjust the size of the icon as needed
                                          ),
                                          SizedBox(
                                              width:
                                                  6), // Add space between the icon and the text
                                          SizedBox(
                                            width:
                                                69, // Adjust the width of the text container accordingly
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
                                            //SizedBox(height: 15),
                                          ),
                                          SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                    //SizedBox(height: 15),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //disini
              ],
            ),
          ),
        ),
      ),
    );
  }
}
