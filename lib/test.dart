import 'package:flutter/material.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Upload Excel Data to Firestore'),
        ),
        body: Center(
          child: Text('Upload Excel Data'),
        ),
      ),
    );
  }
}
