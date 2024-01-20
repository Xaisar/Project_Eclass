import 'package:intl/intl.dart';

class Meet{
  String id;
  String code;
  String name;
  DateTime start_time;
  String tanggal;
  String waktu;
  String meeting_number;

  Meet({
    required this.id,
    required this.name,
    required this.code,
    required this.start_time,
    required this.tanggal,
    required this.waktu,
    required this.meeting_number,
  });

  factory Meet.fromJson(Map<String, dynamic> json){
    return new Meet(
      id: json["id"].toString(),
      name: json["name"].toString(),
      code: json["code"].toString(),
      start_time: DateTime.parse(json["start_time"]),
      tanggal: DateFormat("yyyy-MM-dd").format(DateTime.parse(json["start_time"])).toString(),
      waktu: DateFormat("hh:mm").format(DateTime.parse(json["start_time"])).toString(),
      meeting_number: json["meeting_number"].toString(),
      );
  }
}