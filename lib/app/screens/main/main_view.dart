import 'package:ai_voice_changer_app/app/screens/home/view/generate_list.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/view/inapp_screen.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/viewmodel/premium_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/splash/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    context.read<PremiumViewModel>().loadIsPremium();
  }

  @override
  Widget build(BuildContext context) {
    if (isSeen == true && context.read<PremiumViewModel>().getIsPremium) {
      return const GenerateScreenList();
    } else if (isSeen == true) {
      return const InAppScreen();
    } else {
      return const SplashScreen();
    }
  }
}
