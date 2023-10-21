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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainView(),
    );
  }
}
