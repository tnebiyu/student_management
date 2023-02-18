class Student {
  String? id;
  String? firstName;
  String? lastName;
  String? course;
  int? age;

  Student({this.id, this.firstName, this.lastName, this.course, this.age});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    course = json['course'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['course'] = course;
    data['age'] = age;
    return data;
  }
}
class RegisteredStudent{
 Student student;
  RegisteredStudent({ required this.student});
}