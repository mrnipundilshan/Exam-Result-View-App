import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    String username = " ";
    String password = " ";
    return Scaffold(
      body: Column(
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
              },
              child: const Text("Log In")),
        ],
      ),
    );
  }
}
