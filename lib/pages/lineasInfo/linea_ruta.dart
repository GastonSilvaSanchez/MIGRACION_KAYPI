import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LineaRuta extends StatefulWidget {
  const LineaRuta({Key? key}) : super(key: key);

  @override
  _LineaRutaState createState() => _LineaRutaState();
}

class _LineaRutaState extends State<LineaRuta> {

  static final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(-17.4139766, -66.1653224),
    zoom: 14,
  );
  

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}