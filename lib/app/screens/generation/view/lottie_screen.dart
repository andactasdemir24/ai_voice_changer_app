import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../home/viewmodel/generate_viewmodel.dart';
import 'media_player.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final generationViewModel = Provider.of<GenerateViewModel>(context);
    return generationViewModel.lottieIsSuccsess
        ? const MediaPlayerScreen()
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                MyConstants.lottieText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: MyConstants.black,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.35),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Center(
                  child: Lottie.asset(MyConstants.lottieImage, fit: BoxFit.cover),
                ),
                const Spacer(),
                const Text(
                  MyConstants.lottieText2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF1C1C1E), fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
  }
}
