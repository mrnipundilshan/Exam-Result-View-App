import 'package:flutter/material.dart';

Userservice userservice = Userservice();

class Userservice extends ChangeNotifier {
  String username = "2020ICT29";

  setusername(value) {
    username = value;
    print(username);
    notifyListeners();
  }
}
