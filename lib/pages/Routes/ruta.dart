import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LatLng latLng = LatLng(-17.3938831, -66.233916);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 10.0);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            GoogleMap(
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: cameraPosition)
          ],
        ),
      ),
    );
  }
}
