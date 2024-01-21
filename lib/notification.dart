import 'package:flutter/material.dart';
import 'package:mobile_eclass/api/notifikasi_api.dart';
import 'package:mobile_eclass/dashboard.dart';
import 'package:mobile_eclass/model/notifikasi_model.dart';
import 'package:mobile_eclass/model/siswa_model.dart';

class Notif extends StatefulWidget {
  Siswa siswa;

  Notif({Key? key, required this.siswa}) : super(key: key);
  _NotifState createState() => _NotifState(siswa1: siswa);
}

class _NotifState extends State<Notif> {
  Siswa siswa1;
  _NotifState({required this.siswa1});

  List<Notifikasi> notifikasi= [];
  var _loading = false;
  Future<Null> _isiData()async{
    setState(() {
      _loading = true;
    });
    
    Notifikasi_Api().getNotifikasi(siswa1.id).then((response) {
      setState(() {
        for(Map<String,dynamic> x in response['notifikasi']){
          // print(x);
          notifikasi.add(Notifikasi.fromJson(x));
        };
        // print(_course);
        _loading = false;
      });
    });   
  }

  @override
  initState(){
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
                      "Notifications",
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
        body: 
        _loading? Center(
          child: CircularProgressIndicator(),
        ):
        SafeArea(
          child: 
          notifikasi.length == 0?
          Center(child: Text(
                      "Tidak ada Notifikasi",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        height: 0,
                        fontSize: 20,
                        fontFamily: 'WorkSans-Medium',
                        color: Color(0xFF0A5896),
                        letterSpacing: 0.96,
                      ),
                    ),):
          Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: notifikasi.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    leading: Image.asset("assets/image/logo.png"),
                    title: Text(
                      notifikasi[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                     notifikasi[index].message,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

ListTile _tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    ),
    subtitle: Text(subtitle),
    leading: Icon(icon, color: Colors.blue),
  );
}
