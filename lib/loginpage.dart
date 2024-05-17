import 'package:exam_result/util/colors.dart';
import 'package:exam_result/viewpage.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    String username = " ";
    String password = " ";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Nipun Huttooo"),
            const SizedBox(height: 20),
            TextField(
              onChanged: (text) {
                username = text;
              },
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (text) {
                password = text;
              },
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  print(username);
                  print(password);
                  if (username == "i" && password == "i") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const viewpage()),
                    );
                  }
                },
                child: const Text("Log In")),
          ],
        ),
      ),
    );
  }
}
