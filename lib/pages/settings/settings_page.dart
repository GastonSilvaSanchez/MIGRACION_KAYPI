import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

///
String _valueLanguage = 'Castellano';
var _language = ['Castellano', 'English', 'Portugues'];
//
bool isSelectedUpdated = false;

///
///datos de the
///
String _valueTheme = 'Kaypi';
var _themes = ['Kaypi', 'Univalle', 'Oscuro', 'Rojo', 'Verde'];

//final brightness = ThemeData.estimateBrightnessForColor(_color);
//final icon = brightness == Brightness.light ? Colors.black : Colors.white;

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0.0, left: 10.0, right: 20.0),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        color: Colors.redAccent,
                        size: 30.00,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Idioma',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                            Text(
                              'Elija el idioma de su preferencia',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: DropdownButton(
                          value: _valueLanguage,
                          isExpanded: true,
                          items: _language.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newV) {
                            setState(() {
                              _valueLanguage = newV!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                ///
                //Add switch on/off theme selected
                SwitchListTile(
                  title: Text("Notificaciones"),
                  subtitle: Text(
                      "Descarga automatica ante cambios\n y nuevas rutas de las lineas"),
                  value: isSelectedUpdated,
                  onChanged: (bool values) {
                    setState(() => isSelectedUpdated = values);
                  }, //icon: sync_outline
                  secondary: Icon(
                    Icons.sync_outlined,
                    color: Colors.redAccent,
                    size: 30.00,
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),

                ///
                ///Opcion de privacidad
                ///Descripcion de configuracion de localizacion

                ///Opcion de Apariencia de la aplicacion
                ///Cambio de color de claro a oscuro
                Container(
                  margin: EdgeInsets.only(top: 0.0, left: 10.0, right: 20.0),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.format_color_fill,
                        color: Colors.redAccent,
                        size: 30.00,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Apariencia',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                            Text(
                              'Cambia la apariencia de la aplicacion',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: DropdownButton(
                          value: _valueTheme,
                          isExpanded: true,
                          items: _themes.map((String _items) {
                            return DropdownMenuItem(
                                value: _items, child: Text(_items));
                          }).toList(),
                          onChanged: (String? newV) {
                            setState(() {
                              _valueTheme = newV!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                ///
                ///Opcion de on/off actualizaciones
                ///
                SwitchListTile(
                  title: Text("Actualizaciones"),
                  subtitle: Text(
                      "Descarga automatica ante cambios\n y nuevas rutas de las lineas"),
                  value: isSelectedUpdated,
                  onChanged: (bool values) {
                    setState(() => isSelectedUpdated = values);
                  }, //icon: sync_outline
                  secondary: Icon(
                    Icons.sync_outlined,
                    color: Colors.redAccent,
                    size: 30.00,
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),

/////
              ],
            ),
          ) //

          ),
    );
    //actualizaciones
    //temas
  }

  ///fin de la pagina de dise;o
  ///
  ///Inicio de metodos
  ///

}
