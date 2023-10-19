import 'package:ai_voice_changer_app/app/client/model/token_model.dart';
import 'package:ai_voice_changer_app/app/screens/home/model/persons_model.dart';
import 'package:flutter/material.dart';
import '../../../client/service/voice_service.dart';
import '../../../constants/global_veriables.dart';

class GenerateViewModel with ChangeNotifier {
  List<PersonModel> persons = PersonModel.persons;
  //PersonModel globalPerson = PersonModel(name: 'andac', image: ''); istersen globale değilde buraya da alabilirim
  VoiceService voiceService = VoiceService();
  bool lottieIsSuccsess = false;

  void holdIndex(int index) {
    globalPerson = persons[index];
    notifyListeners();
  }

  Future<void> fetchVoice() async {
    var tokenmodel = TokenModel(
      tts_model_token: globalPerson.token,
      uuid_idempotency_token: uuid.v4(),
      inference_text: controller.text,
    );
    await voiceService.postVoice(tokenmodel);
    lottieIsSuccsess = true;
    notifyListeners();
  }
}
