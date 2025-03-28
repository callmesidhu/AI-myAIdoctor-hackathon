
import 'package:flutter/material.dart';
import 'package:flutter_my_doctor_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
      home: LoginPage()
);
  }
}