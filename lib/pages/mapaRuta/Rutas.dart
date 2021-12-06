import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:flutter_kaypi/pages/model/puntoEstrategico.dart';
import 'package:flutter_kaypi/provider/lineas_api.dart';
import 'package:flutter_kaypi/provider/puntosEstrategicos_api.dart';
import 'package:flutter_kaypi/provider/rutas_providers.dart';
import 'package:flutter_kaypi/zoom_drawer.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Rutas extends StatefulWidget {
  const Rutas({Key? key}) : super(key: key);

  @override
  _RutasState createState() => _RutasState();
}

class _RutasState extends State<Rutas> {
  late GoogleMapController mapController;
  final _carouselController = new CarouselController();
  List<Linea> lines = [];
  List<Linea> nlines = [];
  List<PuntoEstrategico> points = [];
  Set<Marker> markers = {};
  Set<Polyline> polyline = Set<Polyline>();
  List<LatLng> latlng = [];
  List<LatLng> latlngPuntos = [];
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  var cont = 0;
  bool bandera = false;
  int posicion = 0;
  final _rutasProvider = RutasProvider();

  int direccionRuta = 0;

  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(-17.4139766, -66.1653224), zoom: 12.0);
  late Position _currentPosition;

//metodo para obtener la ubicacion actual del dispositivo de manera asincronica
  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  getPuntos() {
    puntoEstrategicoApi.cargarData().then((puntos) {
      setState(() {
        points = puntos;
      });
    });
  }

  getLineas() {
    lineasApi.cargarData().then((lineas) {
      setState(() {
        lines = lineas;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPuntos();
    getLineas();
    // _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutas'),
        elevation: 0,
        leading: InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuZoom()),
            )
          },
          child: Icon(
            Icons.arrow_back,
            size: 28,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            new Factory<OneSequenceGestureRecognizer>(() => new EagerGestureRecognizer(),)
            ].toSet(),
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _initialLocation,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              compassEnabled: true,
              polylines: polyline,
              scrollGesturesEnabled: true,
              rotateGesturesEnabled: true,
              tiltGesturesEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              onTap: _handleTap,
            ),
          ),
          nlines.length > 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarouselSlider.builder(
                        carouselController: _carouselController,
                        itemCount: nlines.length,
                        options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              posicion = index;
                              latlng.clear();
                              setState(() {});
                              for (var i in nlines[posicion]
                                  .ruta[direccionRuta]
                                  .puntos) {
                                //print(new LatLng(i.lat, i.lng));
                                latlng.add(new LatLng(i.lat, i.lng));
                              }
                              _OnMapCreated(mapController);
                            },
                            enableInfiniteScroll: false,
                            height: 100,
                            viewportFraction: 1),
                        itemBuilder: (_, i, ri) {
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.0),
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image:
                                        AssetImage('assets/img/KaypiLogo.png')),
                                title: Text(
                                  nlines[posicion].nombre,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(nlines[posicion].horarios[0]),
                                trailing: //Text(nlines[posicion].categoria)
                                    TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (direccionRuta == 0) {
                                        direccionRuta = 1;
                                      } else if (direccionRuta == 1) {
                                        direccionRuta = 0;
                                      }
                                      if (nlines.length > 0) {
                                        latlng.clear();
                                        setState(() {});
                                        for (var i in nlines[posicion]
                                            .ruta[direccionRuta]
                                            .puntos) {
                                          //print(new LatLng(i.lat, i.lng));
                                          latlng.add(new LatLng(i.lat, i.lng));
                                        }
                                        print(
                                            'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS $direccionRuta');
                                        _OnMapCreated(mapController);
                                        bandera = false;
                                      } else {
                                        bandera = true;
                                      }
                                    });
                                  },
                                  child: direccionRuta == 0
                                      ? Icon(Icons.arrow_downward_sharp)
                                      : Icon(Icons.arrow_upward),
                                ),

                                // Text(nlines[posicion].,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)
                              ));
                        }),
                    Divider(
                      height: 2,
                    ),
                    AnimatedSmoothIndicator(
                        effect: SlideEffect(dotHeight: 8, dotWidth: 8),
                        activeIndex: posicion,
                        count: nlines.length),
                    SizedBox(height: 6),
                    /*Container(
                        height: 30,
                        color: Colors.red,
                        width: double.infinity,
                        child: GestureDetector(
                          child: Text(
                            'Limpiar Busquedad',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            markers.clear();
                            latlngPuntos.clear();
                            polyline.clear();
                            nlines = [];
                            setState(() {});
                          },
                        )),*/
                  ],
                )
              // : bandera
              //     ? Container(
              //         height: 70,
              //         color: Colors.red,
              //         width: double.infinity,
              //         child: GestureDetector(
              //           child: Column(
              //             children: [
              //               Text(''),
              //               Text(
              //           'No se encontro rutas disponibles\n Limpiar Busquedad',
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 18,
              //                     fontWeight: FontWeight.bold),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ],
              //           ),
              //           onTap: () {
              //             markers.clear();
              //             latlngPuntos.clear();
              //             polyline.clear();
              //             nlines = [];
              //              bandera=false;
              //             setState(() {});
              //           },
              //         ))
              : Container(),
          Container(
              height: 30,
              color: Colors.red,
              width: double.infinity,
              child: GestureDetector(
                child: Text(
                  'Limpiar Busquedad',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  markers.clear();
                  latlngPuntos.clear();
                  polyline.clear();
                  nlines = [];
                  setState(() {});
                },
              )),
        ],
      ),
    );
  }

  _handleTap(LatLng point) {
    setState(() {
      if (markers.length <= 1) {
        latlngPuntos.add(point);
        markers.add(Marker(
          markerId: MarkerId(markers.length.toString()),
          position: point,
          infoWindow: InfoWindow(
            title: 'I am a marker',
          ),
          //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ));
      }
    });
    if (markers.length == 2) {
      _rutasProvider
          .getPuntosCercanos(points, lines, latlngPuntos)
          .then((value) => {
                setState(() {
                  nlines = value;
                  if (nlines.length > 0) {
                    latlng.clear();
                    setState(() {});
                    for (var i in nlines[posicion].ruta[direccionRuta].puntos) {
                      //print(new LatLng(i.lat, i.lng));
                      latlng.add(new LatLng(i.lat, i.lng));
                    }
                    print(
                        'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS $direccionRuta');
                    _OnMapCreated(mapController);
                    bandera = false;
                  } else {
                    bandera = true;
                  }
                })
              });
    }
  }

  void _OnMapCreated(GoogleMapController mapController) {
    setState(() {
      mapController = mapController;
      polyline.add(Polyline(
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        polylineId: PolylineId('linea'),
        visible: true,
        points: latlng,
        width: 3,
        color: Color.fromRGBO(48, 79, 254, 1.0),
      ));
    });
  }
}
