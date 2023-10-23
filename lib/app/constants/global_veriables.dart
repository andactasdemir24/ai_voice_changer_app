import 'package:ai_voice_changer_app/app/core/hive/model/history.dart';
import 'package:ai_voice_changer_app/app/screens/home/model/persons_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

PersonModel globalPerson = PersonModel(name: '', image: '', token: '');
TextEditingController controller = TextEditingController();
Uuid uuid = const Uuid();
String voiceurl = '';
int maxButtonPressCount = 5;
History history = History(veri: '', image: '', name: '', text: '');
