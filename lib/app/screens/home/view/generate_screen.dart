// ignore_for_file: use_build_context_synchronously
import 'package:ai_voice_changer_app/app/components/custom_appbar.dart';
import 'package:ai_voice_changer_app/app/constants/const.dart';
import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/core/hive/model/history.dart';
import 'package:ai_voice_changer_app/app/screens/generation/view/lottie_screen.dart';
import 'package:ai_voice_changer_app/app/screens/home/model/persons_model.dart';
import 'package:ai_voice_changer_app/app/screens/home/viewmodel/generate_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/home/viewmodel/home_viewmodel.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/view/inapp_screen.dart';
import 'package:ai_voice_changer_app/app/screens/inapp/viewmodel/premium_viewmodel.dart';
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
    final homeViewModel = Provider.of<HomeViewModel>(context);
    var read = context.read<HistoryViewModel>();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        text: MyConstants.appBarText,
        icon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Text(
                  MyConstants.generateText,
                  style: TextStyle(
                    color: MyConstants.black,
                    fontSize: width * 0.045,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: controller,
                  maxLines: 5,
                  maxLength: 180,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                    hintText: MyConstants.generatehintText,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
                child: Text(
                  MyConstants.selectAllGenerate,
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: PersonsWidget(persons: persons),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                      await context.read<PremiumViewModel>().loadIsPremium();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LottieScreen(),
                        ),
                      );
                      if (context.read<PremiumViewModel>().getIsPremium == true) {
                        await generationViewModel.fetchVoice().catchError((error) {
                          Navigator.pop(context);
                        });
                        await homeViewModel.saveIsSeen2();
                        read.add(History(
                          veri: voiceurl,
                          image: globalPerson.image,
                          name: globalPerson.name,
                          text: controller.text,
                        ));
                      } else {
                        final userBox = await Hive.openBox<UserData>('user_data');
                        if (!userBox.containsKey(0)) {
                          final userData = UserData(0);
                          userBox.put(0, userData);
                        }
                        UserData? userData = userBox.getAt(0);
                        if (userData != null) {
                          if (userData.buttonPressCount < maxButtonPressCount) {
                            await generationViewModel.fetchVoice().catchError((error) {
                              Navigator.pop(context);
                            });
                            await homeViewModel.saveIsSeen2();
                            read.add(History(
                              veri: voiceurl,
                              image: globalPerson.image,
                              name: globalPerson.name,
                              text: controller.text,
                            ));
                            userData.buttonPressCount++;
                            userBox.putAt(0, userData);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InAppScreen(),
                              ),
                            );
                          }
                        } else {
                          // Kullanıcı verileri yüklenemedi
                        }
                      }
                    }
                    controller.clear();
                  },
                  text: MyConstants.generate,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
