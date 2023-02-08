import 'package:shared_preferences/shared_preferences.dart';

class ThemeLoader {
  late final SharedPreferences sharedPreferences;

  Future<bool?> getCurrentTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final bool? isDark = sharedPreferences.getBool("_isDark");
    return isDark;
  }

  setTheme(bool isDark) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("_isDark", isDark);
  }
}
