import 'package:flutter/material.dart';
import 'package:flutter_kaypi/screens/menu_item.dart';

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const rutas = MenuItem('Rutas', Icons.add_road_rounded);
  static const lineas = MenuItem('Lineas', Icons.directions_bus);
  static const directorio =
      MenuItem('Directorio Municipal', Icons.info_outline_rounded);
  static const paradas = MenuItem('Paradas', Icons.departure_board_rounded);
  static const configuracion =
      MenuItem('Configuracion', Icons.settings_applications);
  static const ayuda = MenuItem('Ayuda', Icons.help_center_rounded);
  static const info = MenuItem('Acerca De', Icons.info_rounded);

  static const elements = <MenuItem>[
    home,
    rutas,
    lineas,
    directorio,
    paradas,
    configuracion,
    ayuda,
    info,
  ];
}

class MenuScreen extends StatelessWidget {
  final MenuItem menuItem;
  final ValueChanged<MenuItem> onClickItem;

  const MenuScreen({
    Key? key,
    required this.menuItem,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[800],
      body: Container(
        /*decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Colors.grey,
                  Colors.blueAccent,
                ],),
        ),*/

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Spacer(flex: 2,),
            Container(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.topLeft,
              margin: new EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/kaypi.png',
                    width: 190,
                  )
                ],
              ),
            ),

            SizedBox(
              height: 24,
            ),

            ...MenuItems.elements.map(BuildMenuItems).toList(),
          ],
        ),
      ),
    );
  }

  //no modificar
  Widget BuildMenuItems(MenuItem data) => ListTileTheme(
        child: ListTile(
          selected: menuItem == data,
          minLeadingWidth: 20,
          leading: Icon(
            data.icon,
            color: Colors.grey[200],
          ),
          title: Text(
            data.title,
            style:
                TextStyle(color: Colors.grey[200], fontWeight: FontWeight.w200),
          ),
          onTap: () => onClickItem(data),
          selectedTileColor: Colors.white.withOpacity(0.19),
        ),
      );
}
