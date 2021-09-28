import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/puntosEstrategicosPersonalizados/pointer.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter_kaypi/src/locations.dart' as locations;
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FormPuntosPersonalizados extends StatefulWidget {
  const FormPuntosPersonalizados({Key? key}) : super(key: key);

  @override
  _FormPuntosPersonalizadosState createState() =>
      _FormPuntosPersonalizadosState();
}

class _FormPuntosPersonalizadosState extends State<FormPuntosPersonalizados> {
  Map<MarkerId, Marker> _markers = Map();

  final _initialCameraPosition =
      CameraPosition(target: LatLng(-17.3842312, -66.161095), zoom: 10);

  _ontap(LatLng position) async {
    final markerId = MarkerId(_markers.length.toString());

    final bytes = await _myPainterToBitmap(position.toString());
    final marker = Marker(
        markerId: markerId,
        position: position,
        icon: BitmapDescriptor.fromBytes(bytes));

    setState(() {
      _markers[markerId] = marker;
    });
  }

  Future<Uint8List> _myPainterToBitmap(String label) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    pointer mypainter = pointer(label);

    mypainter.paint(canvas, Size(300, 70));

    final ui.Image image = await recorder.endRecording().toImage(300, 70);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KAYPI',
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () => ZoomDrawer.of(context)!.toggle(),
              child: Icon(
                Icons.menu,
                color: Colors.grey[600],
                size: 28,
              ),
            ),
          ),
          body: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            markers: Set.of(_markers.values),
            mapType: MapType.terrain,
            onTap: _ontap,
          ),
        ));
  }
}
