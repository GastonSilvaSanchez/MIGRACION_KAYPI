import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LineaRuta extends StatefulWidget {
  const LineaRuta({Key? key}) : super(key: key);

  @override
  _LineaRutaState createState() => _LineaRutaState();
}

class _LineaRutaState extends State<LineaRuta> {
  //Controlador de servicios de google maps
  GoogleMapController? controller;
  //coleccion de objetos unicos de la clase marker
  Set<Marker> markers = {};
  //coleccion de objetos unicos de muestreo de rutas en el mapa
  Set<Polyline> polyline = Set<Polyline>();
  //listas de latitud,longitud y marcadores
  List<LatLng> latlng = [];
  List<LatLng> latlng2 = [];
  List<Marker> _markers = [];
  var cont = 0;

//posicion inicial de visualizacion del mapa
  final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(-17.4139766, -66.1653224),
    zoom: 12.5,
  );
  final Set<Polyline> _polyline = {};

  @override
  Widget build(BuildContext context) {
    //declarando variable de linea
    final todo = ModalRoute.of(context)!.settings.arguments as Linea;
    latlng.clear();
    //Obtiene en los puntos (long, lat)de la ruta principal y de los marcadores de origen y destino
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

    //Obtiene en los puntos (long, lat)de la ruta secundaria
    latlng2.clear();
    for (var i in todo.ruta[1].puntos) {
      latlng2.add(new LatLng(i.lat, i.lng));
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        markers: Set<Marker>.of(_markers),
        polylines: _polyline,
        onMapCreated: _OnMapCreated,
      ),
    );
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
