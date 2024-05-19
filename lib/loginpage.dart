import 'package:exam_result/components/background.dart';
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
            LoginButton(context, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: "${_usernameTextController.text}@gmail.com",
                      password: _passwordTextController.text)
                  .then((value) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => viewpage()),
                        ),
                      });
            }),
          ],
        ),
      ),
    );
  }
}
