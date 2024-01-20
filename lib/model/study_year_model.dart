class StudyYear{
  String id;
  String year;
  String semester;

  StudyYear({
    required this.id,
    required this.year,
    required this.semester
  });

  factory StudyYear.fromJson(Map<String, dynamic> json){
    return new StudyYear(
      id: json["id"].toString(),
      year: json["year"].toString(), 
      semester: json["semester"].toString());
  }
}