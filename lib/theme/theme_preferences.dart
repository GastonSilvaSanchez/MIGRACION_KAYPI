import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const PREF_KEY = "pref_key";

  setTheme(bool value) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.setBool(PREF_KEY, value);
  }

  getTheme() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return _sharedPreferences.getBool(PREF_KEY) ?? false;
  }
}
