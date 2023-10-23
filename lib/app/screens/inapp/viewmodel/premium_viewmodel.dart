import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremiumViewModel with ChangeNotifier {
  bool isPremium = false;

  bool boxClicked = false;

  bool get getBoxClicked => boxClicked;

  bool get getIsPremium => isPremium;

  void setBoxClicked(bool b) {
    boxClicked = b;
    notifyListeners();
  }

  Future<void> saveIsPremium() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('premium', true);
  }

  Future<void> loadIsPremium() async {
    final preferences = await SharedPreferences.getInstance();
    isPremium = preferences.getBool('premium') ?? false;
    notifyListeners();
  }
}
