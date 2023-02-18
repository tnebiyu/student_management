import 'package:flutter/material.dart';

import '../Utils/constants.dart';
import '../data_manager/data_manager.dart';
import '../model/student_model.dart';
class Home extends StatelessWidget {
StudentManagement studentManagement;
  Home({Key? key, required this.studentManagement }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Student>>(
      future: studentManagement.getStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var student =snapshot.data! as List<Student>;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Student Management'),
            ),
            body: ListView.builder(
              itemCount: student.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(
                    //       studentManagement.student[index].image),
                    // ),
                    title: Text('${student[index].firstName} ${student[index].lastName}',

                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${student[index].course}',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '${student[index].age}',
                      style:const  TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
       if(snapshot.hasError){
         return const Scaffold(
           body: Center(
             child: Text('Error', style: TextStyle(color: Colors.black),),
           ),
         );}
        if(snapshot.data == null){
          return const Scaffold(
            body: Center(
              child: Text('No data',style: TextStyle(color: Colors.black),),
            ),
          );}
        else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
