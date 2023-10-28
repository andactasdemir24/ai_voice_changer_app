import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/view/inapp_screen.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/viewmodel/premium_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/settings/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../../../core/hive/model/user_data.dart';
import '../widgets/settings_webview.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        text: MyConstants.settingsText,
        icon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: width * 0.1),
        child: Column(
          children: [
            !context.read<PremiumViewModel>().getIsPremium
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const InAppScreen()));
                    },
                    child: const CustomListTile(text: MyConstants.settingsText1),
                  )
                : const SizedBox.shrink(),
            const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText2),
            const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText3),
            const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText4),
            const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText5),
            const SettingsWebview(link: 'https://neonapps.co/', text: MyConstants.settingsText6),
            !context.read<PremiumViewModel>().getIsPremium
                ? FutureBuilder<UserData?>(
                    future: _getUserData(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return CustomListTile(text: 'Free right: ${snapshot.data!.buttonPressCount}/5');
                        } else {
                          return const SizedBox.shrink();
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Future<UserData?> _getUserData(BuildContext context) async {
    final userBox = await Hive.openBox<UserData>('user_data');
    if (userBox.isEmpty) {
      return null;
    }
    return userBox.getAt(0);
  }
}

// const CustomListTile(text: MyConstants.settingsText2),
//               const CustomListTile(text: MyConstants.settingsText3),             
//               const CustomListTile(text: MyConstants.settingsText4),
//               const CustomListTile(text: MyConstants.settingsText5),
//               const CustomListTile(text: MyConstants.settingsText6),
