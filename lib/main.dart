import 'package:flutter/material.dart';
import 'package:student_management/data_manager/data_manager.dart';

import 'Pages/home_page.dart';
import 'Utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var studentManagement = StudentManagement();
    return MaterialApp(
      title: 'Student Management',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.cyan,

          )
      ),
      home: Home(studentManagement: studentManagement),
    );
  }
}

