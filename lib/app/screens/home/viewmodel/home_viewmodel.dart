import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel with ChangeNotifier {
  bool isSeen2 = false;

  Future<void> saveIsSeen2() async {
    final preferences2 = await SharedPreferences.getInstance();
    preferences2.setBool('seen2', true);
    notifyListeners();
  }
}