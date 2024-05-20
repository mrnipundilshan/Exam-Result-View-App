import 'package:exam_result/loginpage.dart';
import 'package:exam_result/test.dart';
import 'package:exam_result/viewpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Exam Result App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Loginpage(),
      ),
    );
  }
}
