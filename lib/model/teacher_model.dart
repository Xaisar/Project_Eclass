class Teacher{
  String id;
  String identity_number;
  String name;
  String email;

   Teacher({
    required this.id,
    required this.identity_number,
    required this.name,
    required this.email,
  });

    factory Teacher.fromJson(Map<String, dynamic> json){
    return new Teacher(
      id: json["id"].toString(),
      identity_number: json["identity_number"].toString(),
      name: json["name"].toString(), 
      email: json["email"].toString()
    ); 
  }
}