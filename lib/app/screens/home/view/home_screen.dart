import 'package:flutter/material.dart';
import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/home/view/generate_screen.dart';
import 'package:ai_voice_changer_app/app/screens/settings/view/settings_screen.dart';
import 'package:ai_voice_changer_app/app/theme/voice_icons_icons.dart';
import '../../../components/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        icon: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
          },
          icon: const Icon(VoiceIcons.group),
        ),
        text: MyConstants.appBarText,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AspectRatio(aspectRatio: 200 / 50),
            Text(
              MyConstants.startHere,
              style: TextStyle(
                color: MyConstants.black,
                fontSize: screenWidth * 0.08,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.37,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.6,
              child: Text(
                MyConstants.startHere2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyConstants.black,
                  fontSize: screenWidth * 0.035,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.41,
                ),
              ),
            ),
            const AspectRatio(aspectRatio: 500 / 50),
            Icon(
              VoiceIcons.iconLine,
              size: 0.45 * screenWidth,
            ),
            const AspectRatio(aspectRatio: 500 / 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GenerateScreen(),
                    ),
                  );
                },
                text: MyConstants.generate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
