import 'package:flutter/material.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/screens/home/model/persons_model.dart';
import 'package:ai_voice_changer_app/app/screens/settings/view/settings_screen.dart';
import 'package:ai_voice_changer_app/app/theme/voice_icons_icons.dart';
import 'generate_screen.dart';
import '../widgets/custom_list_container.dart';

class GenerateScreenList extends StatelessWidget {
  const GenerateScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          MyConstants.appBarText,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            icon: const Icon(VoiceIcons.group),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: IconButton(
              onPressed: () {
                globalPerson = PersonModel(token: '', name: '', image: '');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenerateScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                size: width * 0.07,
                color: MyConstants.black,
              ),
            ),
          ),
        ],
      ),
      body: CustomListContainer(
        height: height,
        width: width,
      ),
    );
  }
}
