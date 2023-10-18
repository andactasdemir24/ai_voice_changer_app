import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'media_player.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          MyConstants.lottieText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.35,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Lottie.asset(
              'assets/lottie/Lottie.json',
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MediaPlayerScreen(),
                    ));
              },
              child: const Text('data')),
          const Spacer(),
          const Text(
            MyConstants.lottieText2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1C1C1E),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
