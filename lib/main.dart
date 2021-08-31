import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(LugaresMap());

class LugaresMap extends StatefulWidget {
  @override
  _LugaresMapState createState() => _LugaresMapState();
}

class _LugaresMapState extends State<LugaresMap> {
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final location = new Location().getLocation();
  late LocationData pinPosicion;
  late LocationData actualLocation;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _add(LatLng(pinPosicion.latitude!, pinPosicion.longitude!));
  }

  @override
  Widget build(BuildContext context) {
    final lugarProvider = Provider.of<LugarProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Seleccione una Ubicacion')),
      floatingActionButton: _floatingButtons(context, lugarProvider),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: _CreateMap(),
    );
  }

  Widget _CreateMap() {
    return FutureBuilder(
        future: location,
        builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) {
          if (snapshot.hasData) {
            final pos = snapshot.data; //posicion actual

            pinPosicion = pos!; //posicion del pin
            actualLocation = pos;

            return SafeArea(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(pos.latitude!, pos.longitude!), zoom: 15),
                markers: Set<Marker>.of(markers.values),
              ),
            );
          } else {
            return Center(child: LinearProgressIndicator());
          }
        });
  }

  void _add(LatLng latlng) {
    final MarkerId markerId = MarkerId('normal');

    final marker = Marker(
      markerId: markerId,
      draggable: true,
      onDragEnd: (latLng) {
        pinPosicion = new LocationData.fromMap({
          'latitude': latlng.latitude,
          'longitude': latlng.longitude,
        });
      },
      position: latlng,
      infoWindow: InfoWindow(title: 'lugar', snippet: 'Aqui se ubica el sitio'),
      onTap: () {},
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  _floatingButtons(BuildContext context, LugarProvider lugarProvider) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.13),
          FloatingActionButton.extended(
              heroTag: UniqueKey(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              onPressed: () =>
                  _useActualLocation(context, lugarProvider, pinPosicion),
              label: Row(
                children: [
                  Icon(Icons.pin_drop_rounded),
                  Text('Ir a la ubicaion del Marcador'),
                ],
              )),
          SizedBox(height: 5),
          Spacer(),
        ],
      ),
    );
  }

  _useActualLocation(BuildContext context, LugarProvider lugarProvider,
      LocationData location) {
    return showDialog(
        builder: (context) => AlertDialog(
              title: Text('¿Esta es la ubicaion que esperaba?'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'Confirme que la ubicacion que carco es el lugar a donde desea ir'),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Si'),
                  onPressed: () {
                    lugarProvider.ubication = location;
                    Navigator.of(context).pop();
                    return Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('no'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
        context: context,
        barrierDismissible: true);
  }
}

class LugarProvider {
  set ubication(LocationData ubication) {}
}
