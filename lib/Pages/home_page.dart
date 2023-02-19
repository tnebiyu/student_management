import 'package:flutter/material.dart';
import 'package:student_management/widgets/drawer_widget.dart';

import '../Utils/constants.dart';
import '../data_manager/data_manager.dart';
import '../model/student_model.dart';
class Home extends StatelessWidget {
final StudentManagement studentManagement;
  const Home({Key? key, required this.studentManagement }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Student>>(
      future: studentManagement.getStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var student =snapshot.data!;
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

                      style: kTextStyle1,
                    ),
                    subtitle: Text(
                      '${student[index].course}',
                      style: kTextStyle1,
                    ),
                    trailing: Text(
                      '${student[index].age}',
                      style:kTextStyle1,
                    ),
                  ),
                );
              },
            ),
            drawer: const DrawerCustom());
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
