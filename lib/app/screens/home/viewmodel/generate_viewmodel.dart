import 'package:ai_voice_changer_app/app/screens/home/model/persons_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_veriables.dart';

class GenerateViewModel with ChangeNotifier {
  List<PersonModel> persons = PersonModel.persons;
  //PersonModel globalPerson = PersonModel(name: 'andac', image: ''); istersen globale değilde buraya da alabilirim

  void holdIndex(int index) {
    globalPerson = persons[index];
    notifyListeners();
  }
}
