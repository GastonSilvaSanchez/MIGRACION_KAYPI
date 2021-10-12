import 'package:flutter/material.dart';
import 'package:flutter_kaypi/routes/routes_page.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: false,
          expandedHeight: 200,
          bottom: AppBar(
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search for something',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.camera_alt)),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
      ]),

      drawer: Drawer(
        //Diseño de la lista del menu
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              //Contenido de la lista del menu
              child: Column(
                children: [
                  Expanded(
                      child: ImageIcon(
                    AssetImage('assets/images/splash.png'),
                    color: Colors.white,
                    size: 120,
                  )),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ///Items de la lista
            ///
            /// ///Item:
            ///Icono del item de la lista
            ///Texto del item
            ///OnClick() del item
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('HOME'),
              onTap: () {},
            ),

            ///Item:
            ///Icono del item de la lista
            ///Texto del item
            ///OnClick() del item
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('LINEAS'),
              onTap: () {},
            ),

            ///Item:
            ///Icono del item de la lista
            ///Texto del item
            ///OnClick() del item
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('RUTAS'),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.HELP);
              },
            ),

            ///Item:
            ///Icono del item de la lista
            ///Texto del item
            ///OnClick() del item
            ListTile(
              leading: Icon(Icons.person),
              title: Text('CONFIGURACION'),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.SETTINGS);
              },
            ),

            ///Item:
            ///Icono del item de la lista
            ///Texto del item
            ///OnClick() del item
            ListTile(
              leading: Icon(Icons.person),
              title: Text('ACERCA DE'),
              onTap: () {},
            ),

            ///Item:
            ///Icono del item de la lista
            ///Texto del item
            ///OnClick() del item
            ListTile(
              leading: Icon(Icons.construction),
              title: Text('AYUDA'),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.HELP);
              },
            ),

            ///Item:
            ///Icono del item de la lista
            ///Texto del item
            ///OnClick() del item
            ListTile(
              leading: Icon(Icons.help),
              title: Text('PARADAS'),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.HELP);
              },
            ),
          ],
        ),
      ),

      //
    );
  }
}
