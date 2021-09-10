import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_kaypi/src/locations.dart' as locations;

//metodo a otra vista despues de acceder(ejemplo)
//en ves de este enlazar con el homepage.

class Rutas extends StatefulWidget {
  const Rutas({Key? key}) : super(key: key);
  @override
  _RutasState createState() => _RutasState();
}

class _RutasState extends State<Rutas> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: InkWell(
        onTap: () => ZoomDrawer.of(context)!.toggle(),
        child: Icon(Icons.menu, color: Colors.grey[600], size: 28,),),),

        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(-17.37855009542154, -66.161313955251),
            zoom: 13.0,
          ),
          markers: _markers.values.toSet(),
        ),

      ),
      
    );
  }
}
