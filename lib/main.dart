import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/home/viewmodel/history_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/home/viewmodel/home_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/viewmodel/premium_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'app/core/hive/data/hive_box.dart';
import 'app/screens/onboarding/viewmodel/onboarding_view_model.dart';
import 'app/screens/home/viewmodel/generate_viewmodel.dart';
import 'app/screens/main/main_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Binding'i başlat
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  hiveRegisterAdapter();
  await hiveBox();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
      ChangeNotifierProvider(create: (_) => GenerateViewModel()),
      ChangeNotifierProvider(create: (_) => HistoryViewModel()),
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ChangeNotifierProvider(create: (_) => PremiumViewModel()),
    ],
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
        colorScheme: ColorScheme.fromSeed(seedColor: MyConstants.deepPurple),
        useMaterial3: true,
      ),
      home: const MainView(),
    );
  }
}
