
import 'package:flutter/material.dart';
import 'pages/home_page.dart';


void main() {
  runApp(MyDoctorApp());
}

class MyDoctorApp extends StatelessWidget {
  const MyDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My AI Doctor',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
