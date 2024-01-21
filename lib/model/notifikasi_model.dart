class Notifikasi{
  String id;
  String name;
  String message;

  Notifikasi({
    required this.id,
    required this.name,
    required this.message
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json){
    return new Notifikasi(
      id: json["id"].toString(),
      name: json["name"].toString(), 
      message: json["message"].toString());
  }
}