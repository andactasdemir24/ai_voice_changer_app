// ignore_for_file: use_build_context_synchronously

import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/core/hive/model/history.dart';
import 'package:ai_voice_changer_app/app/screens/generation/view/lottie_screen.dart';
import 'package:ai_voice_changer_app/app/screens/home/model/persons_model.dart';
import 'package:ai_voice_changer_app/app/screens/home/viewmodel/generate_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/view/inapp_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_button.dart';
import '../../../core/hive/model/user_data.dart';
import '../viewmodel/history_viewmodel.dart';
import '../widgets/person_list_container.dart';

class GenerateScreen extends StatelessWidget {
  const GenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PersonModel> persons = PersonModel.persons;

    final generationViewModel = Provider.of<GenerateViewModel>(context);
    var read = context.read<HistoryViewModel>();

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

                          // Önce kutuyu açın ve veriyi alın
                          final userBox = await Hive.openBox<UserData>('user_data');

                          if (!userBox.containsKey(0)) {
                            // Kutu içinde veri yoksa veya boşsa, varsayılan bir UserData nesnesi oluşturun
                            final userData = UserData(0); // Varsayılan değeri 0 olarak kabul edelim
                            userBox.put(0, userData);
                          }

                          UserData? userData = userBox.getAt(0);

                          if (userData != null) {
                            // userData kullanılabilir
                            if (userData.buttonPressCount < maxButtonPressCount) {
                              await generationViewModel.fetchVoice();
                              read.add(History(
                                  veri: voiceurl,
                                  image: globalPerson.image,
                                  name: globalPerson.name,
                                  text: controller.text));
                              userData.buttonPressCount++;
                              userBox.putAt(0, userData);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const InAppScreen(),
                                  ));
                            }
                          } else {
                            // Kullanıcı verileri yüklenemedi
                          }
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
