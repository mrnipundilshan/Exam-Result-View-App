import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class test extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String documentId = 'a'; // Replace with your document ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Specific Document Data'),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Users').snapshots(),
            builder: (context, snapshot) {
              List<Row> userWidgets = [];

              if (snapshot.hasData) {
                final users = snapshot.data?.docs.reversed.toList();
                for (var user in users!) {
                  final userWidget = Row(
                    children: [
                      Text(user['username']),
                      Text(user['password']),
                    ],
                  );
                  userWidgets.add(userWidget);
                }
              }

              return Expanded(
                child: ListView(
                  children: userWidgets,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
