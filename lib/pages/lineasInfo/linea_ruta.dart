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

  GoogleMapController? controller;
  
  Set<Marker> markers ={};
  Set<Polyline> polyline = Set<Polyline>();
  List<LatLng> latlng = [];
  List<Marker> _markers = [];

  static final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(-17.4139766, -66.1653224),
    zoom: 14,
  );
  
  final Set<Polyline> _polyline = {};
  @override
  Widget build(BuildContext context) {

    final todo = ModalRoute.of(context)!.settings.arguments as Linea;
    
    var cont=0;
    
    latlng.clear();
    for (var e in todo.ruta[0].puntos) { 
      latlng.add(new LatLng(e.lat, e.lng));
    
        if(cont==0){
          _markers.add(
            Marker(
              markerId: MarkerId('origin'),
              position: LatLng(e.lat, e.lng)
            )
          );
        }
        else if (cont == todo.ruta[0].puntos.length-1) {
          _markers.add(
          Marker(
            markerId: MarkerId('destination'),
            position: LatLng(e.lat, e.lng)
          )
        );
      }
      cont++;
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
        color: Colors.red,
      ));
    });
  }
}