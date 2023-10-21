import 'package:ai_voice_changer_app/app/components/custom_button.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/home/view/generate_screen.dart';
import 'package:ai_voice_changer_app/app/screens/settings/view/settings_screen.dart';
import 'package:ai_voice_changer_app/app/theme/voice_icons_icons.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            },
            icon: const Icon(VoiceIcons.group)),
        text: MyConstants.appBarText,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AspectRatio(aspectRatio: 200 / 50),
            const Text(
              MyConstants.startHere,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.37),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: const Text(MyConstants.startHere2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.41,
                  )),
            ),
            const AspectRatio(aspectRatio: 500 / 50),
            const Icon(
              VoiceIcons.iconLine,
              size: 195,
            ),
            const AspectRatio(aspectRatio: 500 / 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenerateScreen(),
                      ),
                    );
                  },
                  text: MyConstants.generate),
            )
          ],
        ),
      ),
    );
  }
}
