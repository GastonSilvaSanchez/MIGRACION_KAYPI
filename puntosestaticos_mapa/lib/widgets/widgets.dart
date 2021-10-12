import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:puntosestaticos_mapa/bloc/busqueda/busqueda_bloc.dart';

import 'package:puntosestaticos_mapa/bloc/mapa/mapa_bloc.dart';
import 'package:puntosestaticos_mapa/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:puntosestaticos_mapa/helpers/helpers.dart';
import 'package:puntosestaticos_mapa/models/search_result.dart';
import 'package:puntosestaticos_mapa/search/search_detination.dart';
import 'package:puntosestaticos_mapa/services/traffic_service.dart';

import 'package:polyline_do/polyline_do.dart' as Poly;



part 'btn_ubicacion.dart';
part 'btn_mi_ruta.dart';
part 'btn_seguir_ubicacion.dart';
part 'searchbar.dart';
part  'marcador_manual.dart';