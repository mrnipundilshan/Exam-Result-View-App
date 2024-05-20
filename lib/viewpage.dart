import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:exam_result/components/background.dart';
import 'package:flutter/material.dart';

class viewpage extends StatefulWidget {
  const viewpage({super.key});

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> with TickerProviderStateMixin {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Background(
          child: currentUser == null
              ? Center(child: Text('No user logged in'))
              : StreamBuilder<QuerySnapshot>(
                  stream: firestore
                      .collection('Users')
                      .where('email', isEqualTo: currentUser.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No Data Available'));
                    }

                    final userDocument = snapshot.data!.docs.first;
                    final String username = userDocument['username'];

                    return ListView(
                      children: [
                        ListTile(
                          title: Text(username),
                        ),
                      ],
                    );
                  },
                ),
        ));
  }
}
