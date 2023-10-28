import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ai_voice_changer_app/app/components/custom_button.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/viewmodel/premium_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/close_button.dart';
import '../widgets/webview_texts.dart';
import '../widgets/custom_price_container.dart';
import '../widgets/custom_texts.dart';

import '../../home/view/generate_list.dart';
import '../../home/view/home_screen.dart';

class InAppScreen extends StatefulWidget {
  const InAppScreen({Key? key}) : super(key: key);

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool isLandscape = (MediaQuery.of(context).orientation == Orientation.landscape);
    double gridViewSpacing = isLandscape ? 10 : 5;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Column(
            children: [
              Stack(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisSpacing: gridViewSpacing,
                    mainAxisSpacing: gridViewSpacing,
                    crossAxisCount: isLandscape ? 4 : 2,
                    children: const [
                      Image(image: MyConstants.inappfirst),
                      Image(image: MyConstants.inappsecond),
                      Image(image: MyConstants.inappthird),
                      Image(image: MyConstants.inappfourth),
                    ],
                  ),
                  ClosedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => isSeen2 ? const GenerateScreenList() : const HomeScreen(),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: -0.01,
                    child: Container(
                      height: height * 0.1,
                      width: width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [MyConstants.transparent, MyConstants.white],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Text(
                MyConstants.inappTrypremium,
                style: TextStyle(
                  color: MyConstants.black,
                  fontSize: isLandscape ? width * 0.05 : width * 0.07,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: isLandscape ? 0.03 : 0.04,
                  letterSpacing: isLandscape ? 0.2 : 0.37,
                ),
              ),
              SizedBox(height: height * 0.05),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(text: MyConstants.inappFirsttext),
                  CustomText(text: MyConstants.inappSecondtext),
                  CustomText(text: MyConstants.inappThirdtext),
                ],
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: const CustomPriceContainer(),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: CustomButton(
                  onPressed: !context.watch<PremiumViewModel>().getBoxClicked
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Choose a plan")));
                        }
                      : () async {
                          context.read<PremiumViewModel>().saveIsPremium().whenComplete(() {
                            context.read<PremiumViewModel>().loadIsPremium();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => isSeen2 ? const GenerateScreenList() : const HomeScreen(),
                              ),
                            );
                          });
                        },
                  text: MyConstants.countinue,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UrlLauncherButton(link: 'https://neonapps.co/', text: MyConstants.privacy),
                  UrlLauncherButton(link: 'https://neonapps.co/', text: MyConstants.restore),
                  UrlLauncherButton(link: 'https://neonapps.co/', text: MyConstants.terms),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
