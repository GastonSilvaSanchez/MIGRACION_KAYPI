//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/Routes/routesPage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/001/946/676/non_2x/abstract-template-blue-geometric-background-free-vector.jpg"),
                  fit: BoxFit.cover),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://s3.tmimgcdn.com/800x0/templates/23775/scr/1590239015166_1.jpg"),
            ),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
              title: Text("Rutas".toUpperCase()),
              leading: Icon(Icons.add_road_rounded),
              //evento on click
              onTap: () => Navigator.of(context).pushNamed(Routes.RUTA)),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
              title: Text("Líneas de transporte".toUpperCase()),
              leading: Icon(Icons.departure_board_rounded),
              //evento on click
              onTap: () => Navigator.of(context).pushNamed(Routes.FORMLINEAS)),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Radio Movil".toUpperCase()),
            leading: Icon(Icons.departure_board_rounded),
            //evento on click
            onTap: () => Navigator.of(context).pushNamed(Routes.RADIOTAXI),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Puntos Estrategicos".toUpperCase()),
            leading: Icon(Icons.departure_board_rounded),
            //evento on click
            onTap: () =>
                Navigator.of(context).pushNamed(Routes.PUNTOSESTRATEGICOS),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Directorio Municipal".toUpperCase()),
            leading: Icon(Icons.departure_board_rounded),
            //evento on click
            onTap: () => Navigator.of(context).pushNamed(Routes.DIRECTORIO),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Noticias y Trafico".toUpperCase()),
            leading: Icon(Icons.departure_board_rounded),
            //evento on click
            onTap: () => Navigator.of(context).pushNamed(Routes.NOTICIAS),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Parqueos".toUpperCase()),
            leading: Icon(Icons.departure_board_rounded),
            //evento on click
            onTap: () => Navigator.of(context).pushNamed(Routes.PARQUEO),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Configuracion".toUpperCase()),
            leading: Icon(Icons.departure_board_rounded),
            //evento on click
            onTap: () => Navigator.of(context).pushNamed(Routes.CONFIGURACION),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Ayuda".toUpperCase()),
            leading: Icon(Icons.local_parking_rounded),
            //evento on click
            onTap: () => Navigator.of(context).pushNamed(Routes.AYUDA),
          ),
          SizedBox(
            height: 20.00,
          ),
          //agregar direccionamiento de acerca de
          ListTile(
            title: Text("Acerca de".toUpperCase()),
            leading: Icon(Icons.info_rounded),
            //evento on click
            onTap: () => Navigator.of(context).push(_NewPage(4)),
          ),
          SizedBox(
            height: 30.00,
          ),
        ],
      ),
    );
  }
}

class _NewPage extends MaterialPageRoute<void> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Page $id'),
              elevation: 1.0,
            ),
            drawer: MyDrawer(),
            body: Center(
              child: Text('Page $id'),
            ),
          );
        });
}
