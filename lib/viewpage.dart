import 'package:exam_result/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class viewpage extends StatelessWidget {
  const viewpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Nipun Huttooo"),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then(
                    (value) {
                      print("sign out");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Loginpage()),
                      );
                    },
                  );
                },
                child: const Text("back")),
          ],
        ),
      ),
    );
  }
}
