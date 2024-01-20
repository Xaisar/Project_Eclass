import 'package:intl/intl.dart';

class Assignment{
  String id;
  String name;
  String number_of_meeting;
  String description;
  String date_start;
  String time_start;
  String date_end;
  String time_end;

  Assignment({
    required this.id,
    required this.name,
    required this.number_of_meeting,
    required this.description,
    required this.date_start,
    required this.time_start,
    required this.date_end,
    required this.time_end,
  });

  factory Assignment.fromJson(Map<String, dynamic> json){
    return new Assignment(
      id: json["id"].toString(),
      name: json["name"].toString(),
      number_of_meeting: json["number_of_meeting"].toString(), 
      description: json["description"].toString(),
      date_start: DateFormat("yyyy-MM-dd").format(DateTime.parse(json["start_time"])).toString(),
      time_start: DateFormat("hh.mm").format(DateTime.parse(json["start_time"])).toString(),
      date_end: DateFormat("yyyy-MM-dd").format(DateTime.parse(json["end_time"])).toString(),
      time_end: DateFormat("hh.mm").format(DateTime.parse(json["end_time"])).toString(),
    );
  }
}