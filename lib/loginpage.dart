import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_result/components/background.dart';
import 'package:exam_result/provider.dart';
import 'package:exam_result/util/reusable.dart';
import 'package:exam_result/viewpage.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _login() async {
    String username = _usernameTextController.text;
    String password = _passwordTextController.text;

    try {
      // Query the Firestore collection to find the matching username
      QuerySnapshot querySnapshot = await _firestore
          .collection('Users')
          .where('username', isEqualTo: username)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document that matches the query
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        String storedPassword = userDoc['password'];

        if (password == storedPassword) {
          // Credentials match, login successful
          userservice.setusername(username);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const viewpage()),
          );
        } else {
          // Password does not match
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid Password')),
          );
        }
      } else {
        // No user found with the given username
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User not found')),
        );
      }
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 18),
              child: Column(
                children: [
                  reusableTextField("Enter Username", Icons.person, false,
                      _usernameTextController),
                  const SizedBox(height: 30),
                  reusableTextField("Enter Password", Icons.lock, false,
                      _passwordTextController),
                ],
              ),
            ),
            const SizedBox(height: 20),
            LoginButton(context, _login),
          ],
        ),
      ),
    );
  }
}
