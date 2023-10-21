import 'package:ai_voice_changer_app/app/core/hive/model/user_data.dart';
import 'package:hive/hive.dart';

import '../model/history.dart';

late Box<UserData> userDataBox;
late Box<History> historyBox;

Future<void> hiveBox() async {
  userDataBox = await Hive.openBox<UserData>('user_data');
  historyBox = await Hive.openBox<History>('history');
}

void hiveRegisterAdapter() {
  Hive.registerAdapter<UserData>(UserDataAdapter());
  Hive.registerAdapter<History>(HistoryAdapter());
}
