import 'package:ai_voice_changer_app/app/core/hive/data/hive_box.dart';
import 'package:flutter/material.dart';

import '../../../core/hive/model/history.dart';

class HistoryViewModel with ChangeNotifier {
  List<History> history = [];

  HistoryViewModel() {
    openBox();
  }
  Future<void> openBox() async {
    historyBox;
    getAll();
    notifyListeners();
  }

  List<History> histories = [];

  void getAll() {
    histories.clear();
    var list = historyBox.values.toList();
    histories.addAll(list);
    notifyListeners();
  }

  void add(History history) {
    historyBox.add(history);
    getAll();
    notifyListeners();
  }
}
