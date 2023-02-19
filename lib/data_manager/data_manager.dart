import '../model/student_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentManagement{
List<Student>? _student;
  List<RegisteredStudent> registeredList  = [];
  fetchStudent() async {
    try {
      const url = 'http://10.0.2.2:8080/api/v1/students';

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _student = [];
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        for (var json in decodedData) {
          _student?.add(Student.fromJson(json));
        }
      } else {
        throw Exception("Error loading data");
      }
    } catch (e) {
      throw Exception("Error loading data");
    }
  }
  Future<List<Student>> getStudent() async{
    if(_student == null){
      await fetchStudent();
    }
    return _student!;

  }

  void addStudent(Student student) {
    bool isFound = false;
    for(var item in registeredList){
      if(item.student.id == student.id){
        isFound =true;
      }

    }
    if(!isFound){
      registeredList.add(RegisteredStudent( student: student));
    }
  }
  removeStudent(Student student) {
    registeredList.removeWhere((element) => element.student.id == student.id);
  }
  clearRegisteredStudent(){
    registeredList.clear();
  }
  void updateStudent(Student newStudent){
    bool isFound = false;
        for(var item in registeredList){
          if(item.student.id == newStudent.id){
            isFound =true;
            item.student = newStudent;




          }
        }
        if(!isFound){
        addStudent(newStudent);
        }
  }
}

