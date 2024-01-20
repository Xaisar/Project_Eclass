import 'package:flutter/material.dart';
// import 'package:mobile_eclass/dashboard.dart';
import 'package:mobile_eclass/detail.dart';

class ConferenceRoom extends StatefulWidget {
  const ConferenceRoom({Key? key}) : super(key: key);

  @override
  State<ConferenceRoom> createState() => _ConferenceRoomState();
}

class _ConferenceRoomState extends State<ConferenceRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24),
            const Text(
              'Conference Room',
              style: TextStyle(
                color: Color(0xFF0A5896),
                fontSize: 24,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0), // Memberi jarak 20 dari kiri
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => DetailPage()),
                      // ); // Tindakan yang ingin dijalankan saat ikon diklik
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.59),
            Container(
              width: 320,
              height: 84,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.5, color: Color(0xFF719EC2)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(95, 0, 95, 0),
                    child: Text(
                      'Lorem Ipsum',
                      style: TextStyle(
                        color: Color(0xFF0A5896),
                        fontSize: 20,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w600,
                        height: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Kode Meeting : abcdefg',
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
              width: 320,
              height: 444,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    width: 304,
                    height: 204,
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
                const Text(
                  'Lorem Ipsum | X IPA  1 | Fisika',
                  style: TextStyle(
                    color: Color(0xFF0A5896),
                    fontSize: 20,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 280, // Panjang TextField
                  height: 30, // Lebar TextField
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Kageyama Tobio',
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
                ),
                const SizedBox(height: 15),
                Container(
                  width: 280,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0A5896),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(85, 0, 30, 0),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 50),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ), // Icon yang ingin ditambahkan
                          onPressed: () {
                            // Tindakan saat ikon ditekan
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 242,
                  height: 34,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 12,
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                padding: const EdgeInsets.only(
                                  top: 0.92,
                                  left: 2.75,
                                  right: 3.21,
                                  bottom: 1.37,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 16.04,
                                      height: 19.71,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 3.61,
                                            top: 0,
                                            child: Container(
                                              width: 8.82,
                                              height: 13.15,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://via.placeholder.com/9x13"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Positioned(
                                            left: 0,
                                            top: 8.07,
                                            child: SizedBox(
                                              width: 16.04,
                                              height: 8.74,
                                              child: Stack(children: []),
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
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0A5896),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3.19, vertical: 5.81),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 55,
                        top: 12,
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                padding: const EdgeInsets.only(
                                  top: 4.58,
                                  left: 1.83,
                                  right: 1.07,
                                  bottom: 3.21,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 19.10,
                                      height: 14.21,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: SizedBox(
                                              width: 14.21,
                                              height: 14.21,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Container(
                                                      width: 14.21,
                                                      height: 14.21,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://via.placeholder.com/14x14"),
                                                          fit: BoxFit.fill,
                                                        ),
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 71,
                        top: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0A5896),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3.19, vertical: 5.81),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 110,
                        top: 12,
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                padding: const EdgeInsets.only(
                                  top: 1.83,
                                  left: 1.83,
                                  right: 1.83,
                                  bottom: 2.02,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 18.33,
                                      height: 18.15,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 11.42,
                                            child: SizedBox(
                                              width: 14.44,
                                              height: 6.73,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Container(
                                                      width: 14.44,
                                                      height: 6.73,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://via.placeholder.com/14x7"),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 2.35,
                                            top: 0,
                                            child: Container(
                                              width: 9.75,
                                              height: 9.75,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://via.placeholder.com/10x10"),
                                                  fit: BoxFit.fill,
                                                ),
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
                        ),
                      ),
                      Positioned(
                        left: 165,
                        top: 12,
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                padding: const EdgeInsets.only(
                                  top: 1.83,
                                  left: 1.83,
                                  right: 1.87,
                                  bottom: 1.88,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 18.30,
                                      height: 18.29,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: SizedBox(
                                              width: 18.30,
                                              height: 18.29,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: -0,
                                                    child: Container(
                                                      width: 18.30,
                                                      height: 18.29,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://via.placeholder.com/18x18"),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 3.72,
                                            top: 4.24,
                                            child: Container(
                                              width: 4.59,
                                              height: 4.59,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://via.placeholder.com/5x5"),
                                                  fit: BoxFit.fill,
                                                ),
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
                        ),
                      ),
                      Positioned(
                        left: 220,
                        top: 12,
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                padding: const EdgeInsets.only(
                                  top: 1.83,
                                  left: 1.83,
                                  right: 2.49,
                                  bottom: 1.17,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 17.68,
                                      height: 18.99,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: SizedBox(
                                              width: 17.68,
                                              height: 18.99,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: -0,
                                                    top: 0,
                                                    child: Container(
                                                      width: 17.68,
                                                      height: 18.99,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://via.placeholder.com/18x19"),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 5.74,
                                            top: 6.39,
                                            child: Container(
                                              width: 6.21,
                                              height: 6.21,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://via.placeholder.com/6x6"),
                                                  fit: BoxFit.fill,
                                                ),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
