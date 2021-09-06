import 'package:flutter/widgets.dart';
import 'package:flutter_kaypi/pages/Routes/routesPage.dart';
import 'package:flutter_kaypi/pages/home/homePage.dart';
import 'package:flutter_kaypi/pages/prueba/ventana_prueba.dart';
import 'package:flutter_kaypi/pages/requestPermission/requestPermissionPage.dart';
import 'package:flutter_kaypi/pages/splash/splash_pages.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return RutaPage;
}

Map<String, Function> get RutaPage {
  return {
  Routes.SPLASH: (_) => const SplashPage(),
  Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
  Routes.HOME: (_) => const HomePage(),
  Routes.PRUEBA: (_) => const NewScreen(),
  Routes.RUTAS: (_) => const RutaPage(),
};
}
