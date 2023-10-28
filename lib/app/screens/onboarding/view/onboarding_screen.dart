import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ai_voice_changer_app/app/components/custom_button.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/view/inapp_screen.dart';
import '../viewmodel/onboarding_view_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AspectRatio(
                aspectRatio: 200 / 48,
              ),
              Image(
                image: MyConstants.splashImage,
                width: width * 0.55,
              ),
              const AspectRatio(
                aspectRatio: 900 / 48,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Text(
                  MyConstants.onboardingTextBold,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyConstants.black,
                    fontSize: width * 0.09,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: 1,
                    letterSpacing: 0.37,
                  ),
                ),
              ),
              const AspectRatio(
                aspectRatio: 50,
              ),
              Text(
                MyConstants.onboardingTextDesc,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: width * 0.05,
                      letterSpacing: -0.38,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                textAlign: TextAlign.center,
              ),
              const AspectRatio(
                aspectRatio: 600 / 50,
              ),
              Text(
                MyConstants.onboardingText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.045,
                      letterSpacing: -0.47,
                      fontFamily: 'SF Pro Text',
                    ),
                textAlign: TextAlign.center,
              ),
              const AspectRatio(
                aspectRatio: 350 / 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: CustomButton(
                  onPressed: () {
                    viewModel.saveIsSeen();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const InAppScreen()),
                    );
                  },
                  text: MyConstants.countinue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
