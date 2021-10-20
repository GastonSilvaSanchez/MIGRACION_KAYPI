import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FormPuntos extends StatefulWidget {
  const FormPuntos({Key? key}) : super(key: key);

  @override
  _FormPuntosState createState() => _FormPuntosState();
}

class _FormPuntosState extends State<FormPuntos> {
  late List data;
  var newData;
  bool _isCenEduVisible = true;
  bool _isCenTurVisible = true;
  bool _isRecCulVisible = true;
  bool _isCenAbaVisible = true;
  bool _isAteSalVisible = true;
  bool _isEntPubVisible = true;
  bool _isCenTraVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => ZoomDrawer.of(context)!.toggle(),
            child: Icon(
              Icons.menu,
              color: Colors.grey[600],
              size: 28,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: FutureBuilder(
            future: cargarData(context),
            builder: (context, snapshot) {
              // Decode the JSON
              newData = json.decode(snapshot.data.toString());
              List jsonEducativos =
                  getPointsFromCat("Centros Educativos", newData);
              List jsonTuristicos =
                  getPointsFromCat("Centros Tur\u00edsticos", newData);
              List jsonRecCultura =
                  getPointsFromCat("Recreaci\u00f3n y Cultura", newData);
              List jsonCentAbasto =
                  getPointsFromCat("Centros de Abasto", newData);
              List jsonCenAtSalud = getPointsFromCat(
                  "Centros de Atenci\u00f3n en Salud", newData);
              List jsonEntPublica =
                  getPointsFromCat("Entidades Publicas", newData);
              List jsonCentTransp =
                  getPointsFromCat("Centros de Transporte", newData);
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(),
                    ListTile(
                      onTap: () =>
                          setState(() => _isCenEduVisible = !_isCenEduVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(jsonEducativos[0]['Imagen']),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Centros Educativos",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isCenEduVisible == true
                          ? Icon(
                              Icons.arrow_upward_outlined,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _categoryList(_isCenEduVisible, jsonEducativos),
                    ListTile(
                      onTap: () =>
                          setState(() => _isCenTurVisible = !_isCenTurVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(jsonTuristicos[0]['Imagen']),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Centros Turísticos",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isCenTurVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _categoryList(_isCenTurVisible, jsonTuristicos),
                    ListTile(
                      onTap: () =>
                          setState(() => _isRecCulVisible = !_isRecCulVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(jsonRecCultura[0]['Imagen']),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Recreación y Cultura",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isRecCulVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _categoryList(_isRecCulVisible, jsonRecCultura),
                    ListTile(
                      onTap: () =>
                          setState(() => _isCenAbaVisible = !_isCenAbaVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(jsonCentAbasto[0]['Imagen']),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Centros de Abasto",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isCenAbaVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _categoryList(_isCenAbaVisible, jsonCentAbasto),
                    ListTile(
                      onTap: () =>
                          setState(() => _isAteSalVisible = !_isAteSalVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(jsonCenAtSalud[0]['Imagen']),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Centros de Atención en Salud",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isAteSalVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _categoryList(_isAteSalVisible, jsonCenAtSalud),
                    ListTile(
                      onTap: () =>
                          setState(() => _isEntPubVisible = !_isEntPubVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(jsonEntPublica[0]['Imagen']),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Entidades Publicas",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isEntPubVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _categoryList(_isEntPubVisible, jsonEntPublica),
                    ListTile(
                      onTap: () =>
                          setState(() => _isCenTraVisible = !_isCenTraVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(jsonCentTransp[0]['Imagen']),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Centros de Transporte",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isCenTraVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _categoryList(_isCenTraVisible, jsonCentTransp),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

Widget _infoPointCard(List lst, index) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      margin: EdgeInsets.all(15),
      elevation: 10,

      // Dentro de esta propiedad usamos ClipRRect
      child: ClipRRect(
        // Los bordes del contenido del card se cortan usando BorderRadius
        borderRadius: BorderRadius.circular(30),

        // EL widget hijo que será recortado segun la propiedad anterior
        child: Column(
          children: <Widget>[
            // Usamos el widget Image para mostrar una imagen
            SizedBox(
              height: 10,
            ),
            Image(
              // Como queremos traer una imagen desde un url usamos NetworkImage
              image: AssetImage(lst[index]['Imagen']),
            ),

            // Usamos Container para el contenedor de la descripción
            Container(
              padding: EdgeInsets.all(1),
              child: Text(lst[index]['Nombre'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    lst[index]['Descripcion'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () => {},
                    child: Text('Puntos')),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () => {},
                    child: Text('Lineas'))
              ],
            )
          ],
        ),
      ));
}

Widget _categoryList(_isVisible, jsonEducativos) {
  return Visibility(
    visible: _isVisible,
    child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: jsonEducativos.length,
        itemBuilder: (BuildContext context, int index) {
          return _infoPointCard(jsonEducativos, index);
        }),
  );
}

Future cargarData(context) async {
  return await DefaultAssetBundle.of(context)
      .loadString('PuntosEstrategicos.json');
}

getPointsFromCat(String cat, newData) {
  List res = [];
  for (int i = 0; i < newData.length; i++) {
    if (newData[i]['Categoria'] == cat) {
      res.add(newData[i]);
    }
  }
  return res;
}

// ignore: must_be_immutable
class InfoPunto extends StatelessWidget {
  // Declara un campo que contenga el objeto Todo
  var newData;

  // En el constructor, se requiere un objeto Todo
  InfoPunto({Key? key, @required this.newData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo para crear nuestra UI
    return Scaffold(
      appBar: AppBar(
        title: Text(newData['Nombre']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(newData['Descripcion']),
      ),
    );
  }
}
