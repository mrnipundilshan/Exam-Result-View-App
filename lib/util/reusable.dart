import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.blue,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
      labelText: text,
      labelStyle:
          TextStyle(color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.blue.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container LoginButton(BuildContext context, Function onTap) {
  Size size = MediaQuery.of(context).size;
  return Container(
    alignment: Alignment.centerRight,
    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        width: size.width * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 34, 156, 255),
              Color.fromARGB(255, 41, 62, 255)
            ])),
        padding: const EdgeInsets.all(0),
        child: const Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ),
  );
}

PreferredSize appbardesign() {
  User? currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  return PreferredSize(
    preferredSize: const Size.fromHeight(65.0), // Set the height of the AppBar
    child: AppBar(
      centerTitle: true,
      toolbarHeight: 65,
      title: currentUser == null
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

                return Text(username,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ));
              },
            ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(86, 204, 242, 1),
              Color.fromRGBO(47, 128, 237, 1),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      ),
    ),
  );
}
