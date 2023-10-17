import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/widgets/custom_texts.dart';
import 'package:flutter/material.dart';

class InAppScreen extends StatelessWidget {
  const InAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: const [
              Image(image: MyConstants.inappfirst),
              Image(image: MyConstants.inappsecond),
              Image(image: MyConstants.inappthird),
              Image(image: MyConstants.inappfourth),
            ],
          ),
          const Text(
            MyConstants.inappTrypremium,
            style: TextStyle(
              color: Colors.black,
              fontSize: 34,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0.04,
              letterSpacing: 0.37,
            ),
          ),
          const SizedBox(height: 30),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: MyConstants.inappFirsttext),
              CustomText(text: MyConstants.inappSecondtext),
              CustomText(text: MyConstants.inappThirdtext),
            ],
          )
        ],
      ),
    ));
  }
}
