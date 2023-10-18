import 'package:ai_voice_changer_app/app/screens/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/screens/home/view/generate_list.dart';
import 'app/screens/onboarding/viewmodel/onboarding_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => OnboardingViewModel())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Voice Changer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GenerateScreenList(),
    );
  }
}
