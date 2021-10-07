import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lineasInfo/linea_ruta.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:flutter_kaypi/pages/model/puntosEstrategico.dart';
import 'package:flutter_kaypi/pages/puntosEstrategicos/lineaspuntos.dart';
import 'package:flutter_kaypi/provider/lineas_api.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<String> listalineas = <String>[];

class FormPuntos extends StatefulWidget {
  const FormPuntos({Key? key}) : super(key: key);

  @override
  _FormPuntosState createState() => _FormPuntosState();
}

class _FormPuntosState extends State<FormPuntos> {
  List? data;
  List<Linea>? li;
  Linea? linea;
  PuntoEstrategicos? puntoEstrategicos;
  var newData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        //menu lateral
        appBar: AppBar(
          title: Text("PUNTOS ESTRATEGICOS"),
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: InkWell(
            onTap: () => ZoomDrawer.of(context)!.toggle(),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('PuntosEstrategicos.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              newData = json.decode(snapshot.data.toString());

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

                        // EL widget hijo que será recortado segun la propiedad anterior
                        child: Column(
                          children: <Widget>[
                            // Usamos el widget Image para mostrar una imagen
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
                                    onPressed: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PuntosMarcadorGoogle(
                                                      newdata: newData[index],
                                                    )),
                                          )
                                        },
                                    child: Text('Puntos')),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                ElevatedButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.blue,
                                      onSurface: Colors.grey,
                                    ),
                                    onPressed: () => {
                                          //print(newData[index]['Lineas']),
                                          for (var linea in newData[index]
                                              ['Lineas'])
                                            {listalineas.add(linea)},
                                          /*List<String> listLineas = <String>[];
                                          for (var p in newData[index]
                                              ['Lineas'])
                                            {listalineas.add(p)},
                                          for (var r in listalineas) {print(r)},*/
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LineasPuntos(
                                                        listalineas:
                                                            listalineas)),
                                          )
                                        },
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
class PuntosMarcadorGoogle extends StatelessWidget {
  var newdata;
  late GoogleMapController mapController;
  late Position _currentPosition;
  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(-17.399468, -66.157664));
  late Marker m;
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  PuntosMarcadorGoogle({Key? key, @required this.newdata}) : super(key: key);
  Set<Marker> _createMarker() {
    double longitude = double.parse(newdata['Punto']['lng'].toString());
    double latitude = double.parse(newdata['Punto']['lat'].toString());
    return {
      Marker(
          markerId: MarkerId("marker_2"),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(
              title: newdata['Nombre'], snippet: newdata['Descripcion'])),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("VISTA DE MARCADOR")),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: _createMarker(),
            initialCameraPosition: _initialLocation,
            minMaxZoomPreference: MinMaxZoomPreference(13, 17),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              controller.showMarkerInfoWindow(MarkerId('marker_2'));
            },
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                child: ClipOval(
                  child: Material(
                    color: Colors.orange.shade100, // button color
                    child: InkWell(
                      splashColor: Colors.orange, // inkwell color
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(Icons.my_location),
                      ),
                      onTap: () {
                        mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                _currentPosition.latitude,
                                _currentPosition.longitude,
                              ),
                              zoom: 18.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
