import 'package:shared_preferences/shared_preferences.dart';

enum Keys { notFirstTime, userInfo, token, userID, darkMode, language }

class CashHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> putString(
      {required Keys key, required String value}) async {
    await sharedPreferences.setString(key.name, value);
  }

  static String getString({required Keys key}) {
    return sharedPreferences.getString(key.name) ?? "";
  }

  static Future<void> putInt({required Keys key, required int value}) async {
    await sharedPreferences.setInt(key.name, value);
  }

  static int getInt({required Keys key}) {
    return sharedPreferences.getInt(key.name) ?? 0;
  }

  static Future<void> putBool({required Keys key, required bool value}) async {
    await sharedPreferences.setBool(key.name, value);
  }

  static bool getBool({required Keys key}) {
    return sharedPreferences.getBool(key.name) ?? false;
  }

  static Future<void> putDouble(
      {required Keys key, required double value}) async {
    await sharedPreferences.setDouble(key.name, value);
  }

  static double getDouble({required Keys key}) {
    return sharedPreferences.getDouble(key.name) ?? 0;
  }

  static clear() async {
    final dark = getBool(key: Keys.darkMode);
    final language = getString(key: Keys.language);
    await sharedPreferences.clear();
    await sharedPreferences.setBool(Keys.notFirstTime.name, true);
    await sharedPreferences.setBool(Keys.notFirstTime.name, dark);
    await sharedPreferences.setString(Keys.notFirstTime.name, language);
  }
}
