import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/screens/settings/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';

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
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              CustomListTile(text: MyConstants.settingsText1),
              CustomListTile(text: MyConstants.settingsText2),
              CustomListTile(text: MyConstants.settingsText3),
              CustomListTile(text: MyConstants.settingsText4),
              CustomListTile(text: MyConstants.settingsText5),
              CustomListTile(text: MyConstants.settingsText6),
            ],
          ),
        ));
  }
}
