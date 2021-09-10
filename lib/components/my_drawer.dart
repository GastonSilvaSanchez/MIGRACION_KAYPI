import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/ayuda/ayudaKaypi.dart';
import 'package:flutter_kaypi/pages/configuracion/configuracion.dart';
import 'package:flutter_kaypi/pages/directorioMunicipal/directorioMunicipal.dart';
import 'package:flutter_kaypi/pages/lineasInfo/formLineas.dart';
import 'package:flutter_kaypi/pages/mapaRuta/Rutas.dart';
import 'package:flutter_kaypi/pages/parqueos/parqueos.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}


class _MyDrawerState extends State<MyDrawer> {

  List<ScreenHiddenDrawer> data = new List.empty(growable: true);

  @override
  void initState() {
    data.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Home",
        baseStyle: TextStyle( color: Colors.white, fontSize: 15.0),
        colorLineSelected: Colors.lightBlue,
        selectedStyle: TextStyle(backgroundColor: Colors.transparent),
      ),
      Rutas()

    ));

    data.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Rutas",
        baseStyle: TextStyle( color: Colors.white, fontSize: 15.0),
        colorLineSelected: Colors.lightBlue,
        selectedStyle: TextStyle(backgroundColor: Colors.transparent),

      ),
      Rutas()   
    ));

    data.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Lineas",
        baseStyle: TextStyle( color: Colors.white, fontSize: 15.0),
        colorLineSelected: Colors.lightBlue,
        selectedStyle: TextStyle(backgroundColor: Colors.transparent),
      ),
      FormLineas()

    ));

    data.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Directorio Municipal",
        baseStyle: TextStyle( color: Colors.white, fontSize: 15.0),
        colorLineSelected: Colors.lightBlue,
        selectedStyle: TextStyle(backgroundColor: Colors.transparent),
      ),
      Directorio()

    ));

    data.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Paradas",
        baseStyle: TextStyle( color: Colors.white, fontSize: 15.0),
        colorLineSelected: Colors.lightBlue,
        selectedStyle: TextStyle(backgroundColor: Colors.transparent),
        /*onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Parqueos())),*/

      ),
      Parqueos()
    ));

    data.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Configuracion",
        baseStyle: TextStyle( color: Colors.white, fontSize: 15.0),
        colorLineSelected: Colors.lightBlue,
        selectedStyle: TextStyle(backgroundColor: Colors.transparent),
        onTap: () {},

      ),
      Configuracion()
    ));

    data.add(new ScreenHiddenDrawer(
      new ItemHiddenMenu(
        name: "Ayuda",
        baseStyle: TextStyle( color: Colors.white, fontSize: 15.0),
        colorLineSelected: Colors.lightBlue,
        selectedStyle: TextStyle(backgroundColor: Colors.transparent),
        
        onTap: () {},

      ),
      AyudaKaypi()
    ));

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.grey, 
      backgroundColorAppBar: Colors.transparent,
      screens: data,
        //    typeOpen: TypeOpen.FROM_RIGHT,
            disableAppBarDefault: false,
        //    enableScaleAnimin: true,
        //    enableCornerAnimin: true,
        slidePercent: 70.0,
        //    verticalScalePercent: 80.0,
        contentCornerRadius: 40.0,
        //iconMenuAppBar: Icon(Icons.menu),
        //backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
        //    whithAutoTittleName: true,
        //    styleAutoTittleName: TextStyle(color: Colors.red),
           /* actionsAppBar: <Widget>[

            ],*/
        //backgroundColorContent: Colors.transparent,
        //    elevationAppBar: 4.0,
          //  tittleAppBar: Center(child: Icon(Icons.ac_unit),),
        //    enableShadowItensMenu: true,
         // backgroundMenu: DecorationImage(image: AssetImage('assets/img/KaypiLogo.png'),fit: BoxFit.cover),
    );
  }



}

