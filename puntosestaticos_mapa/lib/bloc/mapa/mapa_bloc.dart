import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:puntosestaticos_mapa/themes/theme_uber.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {

  //controlador del mapa
  GoogleMapController?  _mapController;

  //polylkones

  Polyline _miRuta = new Polyline(
    polylineId: PolylineId('mi_ruta'),
    width: 4,
    color: Colors.transparent,
  );

   Polyline _miRutaDestino = new Polyline(
    polylineId: PolylineId('mi_ruta_destino'),
    width: 4,
    color: Colors.black87,
  );

  void initMap ( GoogleMapController controller) {
    if(!state.mapaListo) {
      this._mapController = controller;
      this._mapController?.setMapStyle(jsonEncode(estiloMapa));
      add(OnMapaListo());
    }
  }
  void moverCamara( LatLng destino ) {
    final cameraUpdate = CameraUpdate.newLatLng(destino);
    this._mapController?.animateCamera(cameraUpdate);
  }


  MapaBloc() : super(MapaState()) {
    on<MapaEvent>((event, emit) {
      if(event is OnMapaListo) {
        emit(state.copyWith(mapaListo: true));
      } else if (event is OnNuevaUbicacion) {

        if(state.seguirUbicacion) {
          this.moverCamara(event.ubicacion);
        }


        List<LatLng> points  = [...this._miRuta.points, event.ubicacion];
        this._miRuta = this._miRuta.copyWith(pointsParam: points);

        final currentPolylines = state.polylines;  
        currentPolylines['mi_ruta'] = this._miRuta;  

        emit(state.copyWith(polylines: currentPolylines));    
        //print('Nueva ubicacion  ${event.ubicacion}');
      } else if (event is OnMarcarRecorrido) {

        if(!state.dibujarRecorrido ) {
          this._miRuta = this._miRuta.copyWith(colorParam: Colors.black87);

        }
        else {
          this._miRuta = this._miRuta.copyWith(colorParam: Colors.transparent);
        }
        final currentPolylines = state.polylines;  
        currentPolylines['mi_ruta'] = this._miRuta;  

        emit(state.copyWith(
          polylines: currentPolylines,
          dibujarRecorrido : !state.dibujarRecorrido,
          ));
      } else if (event is OnSeguirUbicacion) {

        if(!state.seguirUbicacion) {
          this.moverCamara(this._miRuta.points[this._miRuta.points.length -1]);
        }

        emit(state.copyWith(seguirUbicacion: !state.seguirUbicacion));

      } else if (event is OnMovioMapa) {

        emit(state.copyWith( ubicacionCentral: event.centroMapa ));

      } else if (event is OnCrearRutaInicioDestino) {

        this._miRutaDestino = this._miRutaDestino.copyWith(
        pointsParam: event.rutaCoordenadas
      );

        final currentPolylines = state.polylines;
        currentPolylines['mi_ruta_destino'] = this._miRutaDestino;

        emit(state.copyWith( polylines: currentPolylines));

      }
         
    });
  }
}
