import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FormPuntos extends StatefulWidget {
  const FormPuntos({Key? key}) : super(key: key);

  @override
  _FormPuntosState createState() => _FormPuntosState();
}

class _FormPuntosState extends State<FormPuntos> {
  //variable que almacena la lista con todos los datos del json
  late List data;

  //variable ocupada para decodificar el json y obtener los datos de la lista
  var newData;
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
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/PuntosEstrategicos.json'),
            builder: (context, snapshot) {
              // decodificacion del json
              newData = json.decode(snapshot.data.toString());

              //listview que contiene nombre y descripcion de los puntos estrategicos
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.all(15),
                      elevation: 10,

                      // Dentro de esta propiedad usamos ClipRRect
                      child: ClipRRect(
                        // Los bordes del contenido del card se cortan usando BorderRadius
                        borderRadius: BorderRadius.circular(30),

                        // widget hijo que será recortado segun la propiedad anterior
                        child: Column(
                          children: <Widget>[
                            // widget Image para mostrar una imagen
                            SizedBox(
                              height: 10,
                            ),
                            Image(
                              // Como queremos traer una imagen desde un url usamos NetworkImage
                              image: AssetImage(newData[index]['Imagen']),
                            ),

                            // Usamos Container para el contenedor de la descripción
                            Container(
                              padding: EdgeInsets.all(1),
                              child: Text(newData[index]['Nombre'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    newData[index]['Descripcion'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
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
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            },
          ),
        ));
  }
}

// ignore: must_be_immutable
class InfoPunto extends StatelessWidget {
  // variable que tiene los datos de donde se realizo el click
  var newData;

  // Constructor donde se pasan los datos
  InfoPunto({Key? key, @required this.newData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo(newData) para crear nuestra UI
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
