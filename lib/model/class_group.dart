class ClassGroup{
  String id;
  String name;
  String code;

  ClassGroup({
    required this.id,
    required this.name,
    required this.code
  });

  factory ClassGroup.fromJson(Map<String, dynamic> json){
    return new ClassGroup(
      id: json["id"].toString(),
      name: json["name"].toString(),
      code: json["code"].toString());
  }
}