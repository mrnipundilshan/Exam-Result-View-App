import 'package:flutter/material.dart';

Userservice userservice = Userservice();

class Userservice extends ChangeNotifier {
  String username = " hutta";

  setusername(value) {
    username = value;
    print(username);
    notifyListeners();
  }
}
