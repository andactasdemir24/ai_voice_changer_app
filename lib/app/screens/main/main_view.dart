import 'package:ai_voice_changer_app/app/screens/inapp/view/inapp_screen.dart';
import 'package:ai_voice_changer_app/app/screens/splash/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool isSeen = false;
  Future<void> loadIsSeen() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      isSeen = preferences.getBool('seen') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadIsSeen();
  }

  @override
  Widget build(BuildContext context) {
    return isSeen ? const InAppScreen() : const SplashScreen();
  }
}
