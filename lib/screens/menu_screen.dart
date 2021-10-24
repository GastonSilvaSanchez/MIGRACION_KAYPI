import 'package:flutter/material.dart';
import 'package:flutter_kaypi/screens/menu_item.dart';

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const rutas = MenuItem('Rutas', Icons.add_road_rounded);
  static const lineas = MenuItem('Lineas', Icons.directions_bus);
  static const paradas =
      MenuItem('Puntos Estrategicos', Icons.departure_board_rounded);
  static const lugares = MenuItem('Lugares Turísticos', Icons.location_city);
  static const configuracion =
      MenuItem('Configuracion', Icons.settings_applications);
  static const ayuda = MenuItem('Ayuda', Icons.help_center_rounded);
  static const info = MenuItem('Acerca De', Icons.info_rounded);

  static const elements = <MenuItem>[
    home,
    rutas,
    lineas,
    paradas,
    lugares,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Center(
                      child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: <Widget>[
                        //SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/kaypi.png',
                                width: 170,
                              )
                            ],
                          ),
                        ),

                        ...MenuItems.elements.map(buildMenuItems).toList(),
                      ],
                    ),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  //no modificar
  Widget buildMenuItems(MenuItem data) => ListTileTheme(
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
                TextStyle(color: Colors.grey[100], fontWeight: FontWeight.w200),
          ),
          onTap: () => onClickItem(data),
          selectedTileColor: Colors.white.withOpacity(0.19),
        ),
      );
}
