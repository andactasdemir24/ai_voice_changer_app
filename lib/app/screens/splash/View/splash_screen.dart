import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';

import '../widgets/linear_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: MyConstants.splashImage,
              width: width * 0.55,
            ),
            const LinearIndicator(),
          ],
        ),
      ),
    );
  }
}
