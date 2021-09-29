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

   Set<Polyline> polyline = Set<Polyline>();
   List<LatLng> latlng = [];

  static final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(-17.4139766, -66.1653224),
    zoom: 14,
  );
  
  final Set<Polyline> _polyline = {};
  @override
  Widget build(BuildContext context) {

    final todo = ModalRoute.of(context)!.settings.arguments as Linea;
    //print('AAAAAAAA');
    
    //List<double> puntos = <double>[];
    for (var e in todo.ruta[1].puntos) { 
                  //print(e.lat);
                  latlng.add(new LatLng(e.lat, e.lng));
    }
    print(latlng);
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
          polylines: _polyline,
          onMapCreated: _OnMapCreated,
      ),
    );
  }

  void _OnMapCreated(GoogleMapController mapController) {

    setState(() {
      controller = mapController;

      _polyline.add(Polyline(
        polylineId: PolylineId('linea'),
        visible: true,
        points: latlng,
        width: 2,
        color: Colors.red,
      ));
    });


  }

}