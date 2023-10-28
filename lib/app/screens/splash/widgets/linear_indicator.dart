import 'dart:async';

import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:flutter/material.dart';

import '../../onboarding/view/onboarding_screen.dart';

class LinearIndicator extends StatefulWidget {
  const LinearIndicator({super.key});

  @override
  State<LinearIndicator> createState() => _LinearIndicatorState();
}

class _LinearIndicatorState extends State<LinearIndicator> {
  double value = 0;
  Timer? timer;

  void determinateIndicator() {
    Timer.periodic(
      const Duration(milliseconds: 150),
      (Timer timer) {
        if (value > 0.9) {
          navigateToAnotherPage();
          timer.cancel();
        } else {
          if (mounted) {
            setState(() {
              value = value + 0.1;
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void navigateToAnotherPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    determinateIndicator();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Container(
            margin: const EdgeInsets.all(20),
            width: width * 0.3,
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: MyConstants.white,
              color: MyConstants.deepPurpleAccent,
              minHeight: 5,
              value: value,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
