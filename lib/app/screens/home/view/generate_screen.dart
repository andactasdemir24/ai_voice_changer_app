import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/screens/generation/view/lottie_screen.dart';
import 'package:ai_voice_changer_app/app/screens/home/model/persons_model.dart';
import 'package:ai_voice_changer_app/app/screens/home/viewmodel/generate_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_button.dart';
import '../widgets/person_list_container.dart';

class GenerateScreen extends StatelessWidget {
  const GenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PersonModel> persons = PersonModel.persons;

    final generationViewModel = Provider.of<GenerateViewModel>(context);
    return Scaffold(
        appBar: CustomAppBar(
            text: MyConstants.appBarText,
            icon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ))),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      MyConstants.generateText,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.41),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                      controller: controller,
                      maxLines: 5,
                      maxLength: 250,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                          hintText: MyConstants.generatehintText)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(MyConstants.selectAllGenerate,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: PersonsWidget(persons: persons), //PERSON LİSTESİ WİDGETI
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                      onPressed: () async {
                        if (controller.text == '') {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(MyConstants.alertTitle),
                                content: const Text(MyConstants.alertContent),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text(MyConstants.alertClose),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LottieScreen(),
                              ));
                          await generationViewModel.fetchVoice();
                        }
                        controller.clear();
                      },
                      text: MyConstants.generate), //CUSTOMBUTTON
                ),
              ],
            ),
          ),
        ));
  }
}
