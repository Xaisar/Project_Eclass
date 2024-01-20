class Kehadiran{
  String id;
  String number_of_meetings;
  String date;
  String status;

  Kehadiran({
    required this.id,
    required this.number_of_meetings,
    required this.date,
    required this.status,
  });

  factory Kehadiran.fromJson(Map<String, dynamic> json){
    return new Kehadiran(
      id: json["id"].toString(),
      number_of_meetings: json["number_of_meetings"].toString(),
      date: json["date"].toString(), 
      status: json["status"].toString() 
      );
  }
}