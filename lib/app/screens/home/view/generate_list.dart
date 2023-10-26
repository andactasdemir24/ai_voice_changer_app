import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/screens/home/model/persons_model.dart';
import 'package:ai_voice_changer_app/app/screens/settings/view/settings_screen.dart';
import 'package:ai_voice_changer_app/app/theme/voice_icons_icons.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_list_container.dart';
import 'generate_screen.dart';

class GenerateScreenList extends StatelessWidget {
  const GenerateScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          MyConstants.appBarText,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ));
              },
              icon: const Icon(VoiceIcons.group)),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                onPressed: () {
                  globalPerson = PersonModel(token: '', name: '', image: '');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenerateScreen(),
                      ));
                },
                icon: const Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.black,
                ),
              ))
        ],
      ),
      body: CustomListContainer(
        height: height,
        width: width,
      ),
    );
  }
}
