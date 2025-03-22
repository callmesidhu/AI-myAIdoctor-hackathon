
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyDoctorApp());
}

class MyDoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My AI Doctor',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}
