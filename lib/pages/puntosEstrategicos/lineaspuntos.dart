import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:flutter_kaypi/pages/model/puntosEstrategico.dart';
import 'package:flutter_kaypi/pages/puntosEstrategicos/formpuntos.dart';
import 'package:flutter_kaypi/provider/lineas_api.dart';
import 'package:flutter_kaypi/provider/puntos_api.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';

class LineasPuntos extends StatefulWidget {
  List<dynamic> listalineas;
  LineasPuntos({Key? key, required this.listalineas}) : super(key: key);

  @override
  _LineasPuntosState createState() => _LineasPuntosState();
}

class _LineasPuntosState extends State<LineasPuntos> {
  GoogleMapController? controller;
  Set<Marker> markers = {};
  Set<Polyline> polyline = Set<Polyline>();
  List<LatLng> latlng = [];
  List<LatLng> latlng2 = [];
  List<Marker> _markers = [];
  var cont = 0;
  var DataLinea;
  final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(-17.4139766, -66.1653224),
    zoom: 12.5,
  );
  final Set<Polyline> _polyline = {};

  @override
  Widget build(BuildContext context) {
    //final todo = ModalRoute.of(context)!.settings.arguments as Linea;

    print("lista lineas");
    print(listalineas);
    latlng.clear();
    /* for (var e in todo.ruta[0].puntos) {
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
    }*/
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('LINEAS'),
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey[600],
              size: 28,
            ),
          ),
        ),
        body: Center(
            child: FutureBuilder(
                future:
                    DefaultAssetBundle.of(context).loadString('Lineas.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  DataLinea = json.decode(snapshot.data.toString());
                  print('LINEA.JSON');

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      //print(DataLinea[index]['Nombre']);
                      return ListView(
                        children: <Widget>[SizedBox(), Text('LINEAS')],
                      );
                    },
                    itemCount: DataLinea == null ? 0 : DataLinea.length,
                  );
                })));
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
