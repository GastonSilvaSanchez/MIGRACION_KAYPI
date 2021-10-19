import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormPuntos extends StatefulWidget {
  const FormPuntos({Key? key}) : super(key: key);

  @override
  _FormPuntosState createState() => _FormPuntosState();
}

class _FormPuntosState extends State<FormPuntos> {
  late List data;
  var newData;
  bool isCenEduVisible = true;
  bool isCenTurVisible = true;
  bool isRecCulVisible = true;
  bool isCenAbaVisible = true;
  bool isAteSalVisible = true;
  bool isEntPubVisible = true;
  bool isCenTraVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Puntos Estrategicos'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('PuntosEstrategicos.json'),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () =>
                            setState(() => isCenEduVisible = !isCenEduVisible),
                        child: Text("Centros Educativos")),
                    Visibility(
                      visible: isCenEduVisible,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jsonEducativos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return infoPointCard(jsonEducativos, index);
                          }),
                    ),
                    TextButton(
                        onPressed: () =>
                            setState(() => isCenTurVisible = !isCenTurVisible),
                        child: Text("Centros Turísticos")),
                    Visibility(
                      visible: isCenTurVisible,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jsonTuristicos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return infoPointCard(jsonTuristicos, index);
                          }),
                    ),
                    TextButton(
                        onPressed: () =>
                            setState(() => isRecCulVisible = !isRecCulVisible),
                        child: Text("Recreación y Cultura")),
                    Visibility(
                      visible: isRecCulVisible,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jsonRecCultura.length,
                          itemBuilder: (BuildContext context, int index) {
                            return infoPointCard(jsonRecCultura, index);
                          }),
                    ),
                    TextButton(
                        onPressed: () =>
                            setState(() => isCenAbaVisible = !isCenAbaVisible),
                        child: Text("Centros de Abasto")),
                    Visibility(
                      visible: isCenAbaVisible,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jsonCentAbasto.length,
                          itemBuilder: (BuildContext context, int index) {
                            return infoPointCard(jsonCentAbasto, index);
                          }),
                    ),
                    TextButton(
                        onPressed: () =>
                            setState(() => isAteSalVisible = !isAteSalVisible),
                        child: Text("Centros de Atención en Salud")),
                    Visibility(
                      visible: isAteSalVisible,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jsonCenAtSalud.length,
                          itemBuilder: (BuildContext context, int index) {
                            return infoPointCard(jsonCenAtSalud, index);
                          }),
                    ),
                    TextButton(
                        onPressed: () =>
                            setState(() => isEntPubVisible = !isEntPubVisible),
                        child: Text("Entidades Publicas")),
                    Visibility(
                      visible: isEntPubVisible,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jsonEntPublica.length,
                          itemBuilder: (BuildContext context, int index) {
                            return infoPointCard(jsonEntPublica, index);
                          }),
                    ),
                    TextButton(
                        onPressed: () =>
                            setState(() => isCenTraVisible = !isCenTraVisible),
                        child: Text("Centros de Transporte")),
                    Visibility(
                      visible: isCenTraVisible,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jsonCentTransp.length,
                          itemBuilder: (BuildContext context, int index) {
                            return infoPointCard(jsonCentTransp, index);
                          }),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

Widget infoPointCard(List lst, index) {
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
