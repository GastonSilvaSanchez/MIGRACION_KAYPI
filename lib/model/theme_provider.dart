import 'package:flutter/material.dart';

class DynamicTheme with ChangeNotifier {
  ThemeData _themeData;

  DynamicTheme(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}
