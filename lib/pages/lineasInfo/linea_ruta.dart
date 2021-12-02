import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:flutter_kaypi/pages/model/puntoEstrategico.dart';
import 'package:flutter_kaypi/provider/lineas_api.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LineaRuta extends StatefulWidget {
  PuntoEstrategico? newdata;
  LineaRuta({this.newdata});

  @override
  _LineaRutaState createState() => _LineaRutaState();
}

class _LineaRutaState extends State<LineaRuta> {
  GoogleMapController? controller;
  Set<Marker> markers = {};
  Set<Polyline> polyline = Set<Polyline>();
  List<LatLng> latlng = [];
  List<LatLng> latlng2 = [];
  List<Marker> _markers = [];
  var cont = 0;

  final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(-17.4139766, -66.1653224),
    zoom: 12.5,
  );
  final Set<Polyline> _polyline = {};

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Linea;

//Aqui se crea el marcador del punto
    if (widget.newdata != null) {
      final PuntoEstrategico? punto = widget.newdata;
      _markers.add(Marker(
          infoWindow: InfoWindow(
            title: punto!.nombre,
          ),
          markerId: MarkerId(punto.id),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: LatLng(
            punto.punto.lat,
            punto.punto.lng,
          )));
    }

    latlng.clear();
    for (var e in todo.ruta[0].puntos) {
      latlng.add(new LatLng(e.lat, e.lng));

      if (cont == 0) {
        _markers.add(Marker(
          markerId: MarkerId('origin'),
          position: LatLng(e.lat, e.lng),
        ));
      } else if (cont == todo.ruta[0].puntos.length - 1) {
        _markers.add(Marker(
            markerId: MarkerId('destination'), position: LatLng(e.lat, e.lng)));
      }
      cont++;
    }

    latlng2.clear();
    for (var i in todo.ruta[1].puntos) {
      latlng2.add(new LatLng(i.lat, i.lng));
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Rutas'),
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: cameraPosition,
              mapType: MapType.normal,
              markers: Set<Marker>.of(_markers),
              polylines: _polyline,
              onMapCreated: _OnMapCreated,
              zoomControlsEnabled: false,
            ),
            Positioned(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: 50.0),
                    child: Card(
                      color: Color.fromRGBO(61, 90, 254, 1.0),
                      child: Container(
                        height: 90.0,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/img/KaypiLogo.png'),
                                backgroundColor: Colors.white,
                                radius: 32.0,
                              ),
                              title: Text(todo.nombre,
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.white)),
                              subtitle: Text(
                                todo.categoria,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      elevation: 10.0,
                      shadowColor: Color.fromRGBO(64, 85, 157, 1.0),
                      borderOnForeground: true,
                    ))),
            Positioned(
                child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 120),
                    width: 160.0,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                              leading: Icon(
                                Icons.circle,
                                color: Color.fromRGBO(48, 79, 254, 1.0),
                              ),
                              title: Text(todo.ruta[0].sentido,
                                  style: TextStyle(fontSize: 12))),
                          ListTile(
                              leading: Icon(
                                Icons.circle,
                                color: Color.fromRGBO(255, 23, 68, 1.0),
                              ),
                              title: Text(todo.ruta[1].sentido,
                                  style: TextStyle(fontSize: 12))),
                        ],
                      ),
                    ))),
          ],
        ));
  }

  void _OnMapCreated(GoogleMapController mapController) {
    setState(() {
      controller = mapController;

      _polyline.add(Polyline(
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        polylineId: PolylineId('linea'),
        visible: true,
        points: latlng,
        width: 3,
        color: Color.fromRGBO(48, 79, 254, 1.0),
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('linea2'),
        visible: true,
        points: latlng2,
        width: 3,
        color: Color.fromRGBO(255, 23, 68, 1.0),
      ));
    });
  }
}
