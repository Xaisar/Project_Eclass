import 'package:mobile_eclass/model/class_group.dart';
import 'package:mobile_eclass/model/study_year_model.dart';
import 'package:mobile_eclass/model/teacher_model.dart';

class Course {
  String id;
  String semester;
  String thumbnail;
  String number_of_meetings;
  String description;
  StudyYear study_year;
  ClassGroup class_group;
  Subject subject;
  Teacher teacher;
  
  Course({
    required this.id,
    required this.semester,
    required this.thumbnail,
    required this.number_of_meetings,
    required this.description,
    required this.study_year, 
    required this.class_group,
    required this.subject,
    required this.teacher
  });

  factory Course.fromJson(Map<String, dynamic> json){
    return new Course(
      id: json["id"].toString(),
      semester: json["semester"].toString(),
      thumbnail: json["thumbnail"].toString(), 
      number_of_meetings: json["number_of_meetings"].toString(), 
      description: json["description"].toString(), 
      study_year: StudyYear.fromJson(json["study_year"]), 
      class_group: ClassGroup.fromJson(json["class_group"]),
      subject: Subject.fromJson(json["subject"]),
      teacher: Teacher.fromJson(json["teacher"]));
  }
    
}

class Subject{
  String id;
  String code;
  String name;
  String grade;

  Subject({
    required this.id,
    required this.code,
    required this.name,
    required this.grade,
  });

   factory Subject.fromJson(Map<String, dynamic> json){
    return new Subject(
      id: json["id"].toString(),
      code: json["code"].toString(),
      name: json["name"].toString(), 
      grade: json["grade"].toString());
  }
}