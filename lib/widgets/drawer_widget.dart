import 'package:flutter/material.dart';
class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
     child: ListView(
      children: [
       DrawerHeader(
           child: Column(
            children: const [
             Icon(Icons.person),
             SizedBox(height: 5,),
             Text('Student Management'),
            ],
           )
       ),
       ListTile(
        title: const Text('List of Students'),
        onTap: () {
         Navigator.pushNamed(context, '/addStudent');
        },
       ),
       ListTile(
        title: const Text('Add Student'),
        onTap: () {
         Navigator.pushNamed(context, '/addStudent');
        },
       ),
       ListTile(
        title: const Text('Update Student'),
        onTap: () {
         Navigator.pushNamed(context, '/updateStudent');
        },
       ),
       ListTile(
        title: const Text('Delete Student'),
        onTap: () {
         Navigator.pushNamed(context, '/deleteStudent');
        },
       ),
      ],
     ),
    );
  }
}
