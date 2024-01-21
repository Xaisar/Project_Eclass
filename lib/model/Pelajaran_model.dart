class Pelajaran{
  String id;
  String name;

  Pelajaran({
    required this.id,
    required this.name
  });

  factory Pelajaran.fromJson(Map<String, dynamic> json){
    return new Pelajaran(
      id: json["id"].toString(),
      name: json["name"].toString()
      );
  }
}