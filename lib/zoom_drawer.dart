import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/ayuda/ayudaKaypi.dart';
import 'package:flutter_kaypi/pages/configuracion/configuracion.dart';
import 'package:flutter_kaypi/pages/home/homePage.dart';
import 'package:flutter_kaypi/pages/info/info.dart';
import 'package:flutter_kaypi/pages/lineasInfo/formLineas.dart';
import 'package:flutter_kaypi/pages/mapaRuta/Rutas.dart';
import 'package:flutter_kaypi/pages/puntosEstrategicos/formpuntos.dart';
import 'package:flutter_kaypi/screens/menu_item.dart';
import 'package:flutter_kaypi/screens/menu_screen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuZoom extends StatefulWidget {
  MenuZoom({Key? key}) : super(key: key);

  @override
  _MenuZoomState createState() => _MenuZoomState();
}

class _MenuZoomState extends State<MenuZoom> {

  MenuItem menuItem = MenuItems.home;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
    style: DrawerStyle.Style1,
    //ventana principal
    mainScreen: getScreen(),
    //evento on click de las opciones del menu
    menuScreen: Builder(
      builder: (context) => MenuScreen(menuItem: menuItem,onClickItem: (item) {setState(() => menuItem = item);
      ZoomDrawer.of(context)!.close();
      }, ),
    ),
    borderRadius: 40,
    showShadow: true,
    angle: -14.00,
    backgroundColor: Colors.indigoAccent.shade400,
    slideWidth: MediaQuery.of(context).size.width*0.7,
    openCurve: Curves.fastOutSlowIn,
    closeCurve: Curves.bounceIn,
    duration: Duration(seconds: 2),

  );

  //metodo para abrir vistas
  Widget getScreen() {
    switch(menuItem)
    {
      case MenuItems.home:
        return HomePage();
      case MenuItems.rutas:
        return Rutas();
      case MenuItems.lineas:
        return FormLineas();
      case MenuItems.paradas:
        return FormPuntos();
      case MenuItems.configuracion:
        return Configuracion();
      case MenuItems.ayuda:
        return AyudaKaypi();
      case MenuItems.info:
      default:
        return InfoApp();

    }
  }  

}

