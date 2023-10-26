import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/view/inapp_screen.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/viewmodel/premium_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/settings/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/settings_webview.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            text: MyConstants.settingsText,
            icon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new))),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              !context.read<PremiumViewModel>().getIsPremium
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const InAppScreen()));
                      },
                      child: const CustomListTile(text: MyConstants.settingsText1))
                  : const SizedBox.shrink(),
              const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText2),
              const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText3),
              const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText4),
              const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText5),
              const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText6),
            ],
          ),
        ));
  }
}

// const CustomListTile(text: MyConstants.settingsText2),
//               const CustomListTile(text: MyConstants.settingsText3),             
//               const CustomListTile(text: MyConstants.settingsText4),
//               const CustomListTile(text: MyConstants.settingsText5),
//               const CustomListTile(text: MyConstants.settingsText6),
