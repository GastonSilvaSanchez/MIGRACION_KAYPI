import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/model/puntoEstrategico.dart';
import 'package:flutter_kaypi/pages/puntosEstrategicos/lineaspuntos.dart';
import 'package:flutter_kaypi/provider/puntosEstrategicos_api.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.indigo.shade600,
      appBar: AppBar(
        title: Text('Puntos Estrategicos'),
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
      body: _lista(context),
    );
  }

  Widget _lista(context) => FutureBuilder<List<PuntoEstrategico>>(
        future: puntoEstrategicoApi.cargarData(),
        initialData: [],
        // ignore: non_constant_identifier_names
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          final lineas = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Error'));
              }

              if (!snapshot.hasData) {
                return Center(child: Text('No hay data'));
              }

              return _buildLineas(lineas!, context);
          }
        },
      );

  Widget _buildLineas(List<PuntoEstrategico> puntosEstrategicos, context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: puntosEstrategicos.length,
        itemBuilder: (context, index) {
          final puntos = puntosEstrategicos[index];
          return Card(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            margin: EdgeInsets.all(15),
            elevation: 10,

            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.grey,
                        Colors.indigo.shade400,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: ClipRRect(
                  // Los bordes del contenido del card se cortan usando BorderRadius

                  // widget hijo que será recortado segun la propiedad anterior
                  child: Column(
                    children: <Widget>[
                      // widget Image para mostrar una imagen
                      SizedBox(
                        height: 10,
                      ),
                      /*Image(
                                // Como queremos traer una imagen desde un url usamos NetworkImage
                                image: AssetImage(puntos.imagen),
                              ),*/

                      // Usamos Container para el contenedor de la descripción
                      Container(
                        padding: EdgeInsets.all(1),
                        child: Text(puntos.nombre,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              puntos.descripcion,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
                                                puntos: puntos,
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
                                                LineasPuntos(puntos: puntos))),
                                  },
                              child: Text('Lineas'))
                        ],
                      )
                    ],
                  ),
                )),
            // Dentro de esta propiedad usamos ClipRRect
          );
        });
  }
}

// ignore: must_be_immutable
class PuntosMarcadorGoogle extends StatelessWidget {
  final PuntoEstrategico puntos;
  late GoogleMapController mapController;
  late Position _currentPosition;
  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(-17.399468, -66.157664));
  late Marker m;
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  PuntosMarcadorGoogle({Key? key, required this.puntos}) : super(key: key);
  Set<Marker> _createMarker() {
    double longitude = double.parse(puntos.punto.lng.toString());
    double latitude = double.parse(puntos.punto.lat.toString());
    return {
      Marker(
          markerId: MarkerId("marker_2"),
          position: LatLng(latitude, longitude),
          infoWindow:
              InfoWindow(title: puntos.nombre, snippet: puntos.descripcion)),
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
