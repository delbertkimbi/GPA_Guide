
import 'package:gpa_calcos/Presentation/screens/chat_ai/constants.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/hive/chat_history.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/hive/settings.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/hive/user_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  // get the caht history box
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(Constants.chatHistoryBox);

  // get user box
  static Box<UserModel> getUser() => Hive.box<UserModel>(Constants.userBox);

  // get settings box
  static Box<Settings> getSettings() =>
      Hive.box<Settings>(Constants.settingsBox);
}
