import 'package:flutter_kaypi/pages/Routes/routesPage.dart';
import 'package:flutter_kaypi/pages/ayuda/ayudaKaypi.dart';
import 'package:flutter_kaypi/pages/configuracion/configuracion.dart';
import 'package:flutter_kaypi/pages/home/homePage.dart';
import 'package:flutter_kaypi/pages/info/info.dart';
import 'package:flutter_kaypi/pages/lineasInfo/formLineas.dart';
import 'package:flutter_kaypi/pages/mapaRuta/Rutas.dart';
import 'package:flutter_kaypi/pages/puntosEstrategicos/formpuntos.dart';
import 'package:flutter_kaypi/pages/puntosEstrategicosPersonalizados/formPuntosPersonalizados.dart';
import 'package:flutter_kaypi/pages/requestPermission/requestPermissionPage.dart';
import 'package:flutter_kaypi/pages/splash/splash_pages.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => const HomePage(),
    Routes.RUTA: (_) => const Rutas(),
    Routes.FORMLINEAS: (_) => const FormLineas(),
    Routes.FormPuntosPersonalizados: (_) => const FormPuntosPersonalizados(),
    Routes.CONFIGURACION: (_) => const Configuracion(),
    Routes.AYUDA: (_) => const AyudaKaypi(),
    Routes.PUNTOSESTRATEGICOS: (_) => const FormPuntos(),
    Routes.INFO: (_) => const InfoApp(),
  };
}
