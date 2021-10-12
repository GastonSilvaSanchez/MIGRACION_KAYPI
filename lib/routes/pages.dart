import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kaypi/pages/help/help.dart';
import 'package:flutter_kaypi/pages/home/home.dart';
import 'package:flutter_kaypi/pages/menu/gps_location.dart';
import 'package:flutter_kaypi/pages/menu/menu.dart';
import 'package:flutter_kaypi/pages/settings/settings_page.dart';
import 'package:flutter_kaypi/routes/routes_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.HOME: (_) => Home(),
    Routes.MENU: (_) => MenuPage(),
    Routes.HELP: (_) => Help(),
    Routes.ASKFORPERMISSION: (_) => GpsLocation(),
    Routes.SETTINGS: (_) => SettingsPage(),
  };
}
