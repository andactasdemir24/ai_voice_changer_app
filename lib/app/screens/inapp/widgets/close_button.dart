// ignore_for_file: must_be_immutable
import 'package:ai_voice_changer_app/app/screens/home/view/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../theme/voice_icons_icons.dart';

class ClosedButton extends StatelessWidget {
  double? width;
  double? height;
  ClosedButton({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Yuvarlak şekil
          color: Colors.grey.withOpacity(0.6), // Dairesel arka plan rengi
        ),
        child: Center(
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              icon: const Icon(
                VoiceIcons.btnClose,
                size: 30,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
