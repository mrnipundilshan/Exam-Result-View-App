import 'package:exam_result/util/colors.dart';
import 'package:exam_result/util/reusable.dart';
import 'package:exam_result/viewpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                reusableTextField("Enter Username", Icons.person, false,
                    _usernameTextController),
                const SizedBox(height: 30),
                reusableTextField("Enter Password", Icons.lock, false,
                    _passwordTextController),
                const SizedBox(height: 30),
                LoginButton(context, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: "${_usernameTextController.text}@gmail.com",
                          password: _passwordTextController.text)
                      .then((value) => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const viewpage()),
                            ),
                          });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
