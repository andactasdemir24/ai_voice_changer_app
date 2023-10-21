import 'package:ai_voice_changer_app/app/core/hive/model/user_data.dart';
import 'package:hive/hive.dart';

late Box<UserData> userDataBox;

Future<void> hiveBox() async {
  userDataBox = await Hive.openBox<UserData>('user_data');
}

void hiveRegisterAdapter() {
  Hive.registerAdapter<UserData>(UserDataAdapter());
}
