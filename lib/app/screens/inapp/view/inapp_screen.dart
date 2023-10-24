// ignore_for_file: use_build_context_synchronously

import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/viewmodel/premium_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/widgets/custom_price_container.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/widgets/custom_texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/custom_button.dart';
import '../../home/view/generate_list.dart';
import '../../home/view/home_screen.dart';
import '../widgets/close_button.dart';
import '../widgets/webview_texts.dart';

class InAppScreen extends StatefulWidget {
  const InAppScreen({super.key});

  @override
  State<InAppScreen> createState() => _InAppScreenState();
}

class _InAppScreenState extends State<InAppScreen> {
  bool isSeen2 = false;
  Future<void> loadIsSeen2() async {
    final preferences2 = await SharedPreferences.getInstance();
    setState(() {
      isSeen2 = preferences2.getBool('seen2') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadIsSeen2();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(
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
              ClosedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => isSeen2 ? const GenerateScreenList() : const HomeScreen()));
                  },
                  width: width * 0.125,
                  height: height * 0.1),
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.white]),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: height * 0.05),
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
          SizedBox(height: height * 0.02),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: CustomPriceContainer()),
          SizedBox(height: height * 0.02),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                onPressed: !context.watch<PremiumViewModel>().getBoxClicked //false ise plan seçtir true ise devam et
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Choose a plan")));
                      }
                    : () async {
                        context
                            .read<PremiumViewModel>()
                            .saveIsPremium()
                            .whenComplete(() => context.read<PremiumViewModel>().loadIsPremium());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => isSeen2 ? const GenerateScreenList() : const HomeScreen(),
                          ),
                        );
                      },
                text: MyConstants.countinue,
              )),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UrlLauncherButton(link: 'https://neonapps.co/', text: MyConstants.privacy),
              UrlLauncherButton(link: 'https://neonapps.co/', text: MyConstants.restore),
              UrlLauncherButton(link: 'https://neonapps.co/', text: MyConstants.terms),
            ],
          )
        ],
      ),
    ));
  }
}
