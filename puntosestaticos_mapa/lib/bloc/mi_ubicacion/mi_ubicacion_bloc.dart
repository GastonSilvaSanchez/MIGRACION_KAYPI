import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';

class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {

  StreamSubscription<Position>? positionStream;

  void iniciarSeguimiento() {
     //Geolocator.isLocationServiceEnabled();

     //final pos =  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 10,
      ).listen((Position position) {
        //print('${position}');
        final nuevaUbicacion = new LatLng(position.latitude, position.longitude);
        add(OnUbicacionCambio(nuevaUbicacion));
      });


    }

    void cancelarSeguimiento() {
        positionStream?.cancel();
    }
  

  MiUbicacionBloc() : super(MiUbicacionState()) {   

    
    on<MiUbicacionEvent>((event, emit) => {  
        if(event is OnUbicacionCambio)       
         emit(state.copyWith(existeUbicacion: true,ubicacion: event.ubicacion))           
    });
  }
  

  
  

  
  
}
