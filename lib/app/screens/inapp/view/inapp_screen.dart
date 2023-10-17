import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/view/webview.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/widgets/custom_price_container.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/widgets/custom_texts.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../widgets/webview_texts.dart';

class InAppScreen extends StatelessWidget {
  const InAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
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
                Image(image: MyConstants.inappfourth)
              ]),
          SizedBox(height: height * 0.03),
          const Text(MyConstants.inappTrypremium,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0.04,
                  letterSpacing: 0.37)),
          SizedBox(height: height * 0.05),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: MyConstants.inappFirsttext),
              CustomText(text: MyConstants.inappSecondtext),
              CustomText(text: MyConstants.inappThirdtext)
            ],
          ),
          SizedBox(height: height * 0.03),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: CustomPriceContainer()),
          SizedBox(height: height * 0.03),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                onPressed: () {},
                text: MyConstants.countinue,
              )),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UrlLauncherButton(
                link: 'https://neonapps.co/',
              ),
              UrlLauncherButton(
                link: 'https://neonapps.co/',
              ),
              UrlLauncherButton(
                link: 'https://neonapps.co/',
              ),
            ],
          )
        ],
      ),
    ));
  }
}
