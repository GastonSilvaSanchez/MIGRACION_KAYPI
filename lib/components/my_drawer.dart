//import 'dart:html';

import 'package:flutter/material.dart';

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
            onTap: () => Navigator.of(context).push(_NewPage(1)),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Líneas de transporte".toUpperCase()),
            leading: Icon(Icons.departure_board_rounded),
            //evento on click
            onTap: () => Navigator.of(context).push(_NewPage(2)),
          ),
          SizedBox(
            height: 20.00,
          ),
          ListTile(
            title: Text("Paradas".toUpperCase()),
            leading: Icon(Icons.local_parking_rounded),
            //evento on click
            onTap: () => Navigator.of(context).push(_NewPage(3)),
          ),
          SizedBox(
            height: 20.00,
          ),
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
            body: Center(
              child: Text('Page $id'),
            ),
          );
        });
}
