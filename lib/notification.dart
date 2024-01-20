import 'package:flutter/material.dart';
import 'package:mobile_eclass/dashboard.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
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
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 625,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: ListTile(
                          leading: Image.asset("assets/image/logo.png"),
                          title: Text(
                            "Lorem Ipsum",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim..",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
