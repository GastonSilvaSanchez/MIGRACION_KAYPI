import 'dart:collection';
import 'dart:math' show cos, sqrt, asin;
import 'package:flutter/material.dart';

import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:flutter_kaypi/pages/model/puntoEstrategico.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RutasProvider with ChangeNotifier {
  Future<List<Linea>> getPuntosCercanos(List<PuntoEstrategico> points,
      List<Linea> lines, List<LatLng> latlng) async {
    List<Linea> nlineas = [];
    Map<String, double> puntoscernaos = new Map<String, double>();
    for (int i = 0; i < points.length; i++) {
      _coordinateDistance(latlng[0].latitude, latlng[0].longitude,
                  points[i].punto.lat, points[i].punto.lng) <
              10.0
          ? puntoscernaos.putIfAbsent(
              points[i].id,
              () => _coordinateDistance(latlng[0].latitude, latlng[0].longitude,
                  points[i].punto.lat, points[i].punto.lng))
          : print('object');
      _coordinateDistance(latlng[0].latitude, latlng[0].longitude,
                  points[i].punto.lat, points[i].punto.lng) <
              10.0
          ? puntoscernaos.putIfAbsent(
              points[i].id,
              () => _coordinateDistance(latlng[1].latitude, latlng[1].longitude,
                  points[i].punto.lat, points[i].punto.lng))
          : print('object');
    }

    if (puntoscernaos.length > 0) {
      var sortedKeys = puntoscernaos.keys.toList(growable: false)
        ..sort((k1, k2) =>
            puntoscernaos[k1]!.compareTo(puntoscernaos[k2]!.toInt()));
      LinkedHashMap sortedMap = new LinkedHashMap.fromIterable(sortedKeys,
          key: (k) => k, value: (k) => puntoscernaos[k]);

      for (int j = 0; j < points.length; j++) {
        if (points[j].id == sortedMap.entries.toList()[0].key) {
          nlineas = lines
              .where((item) => points[j].lineas.contains(item.nombre))
              .toList();
        }
      }
    }

    return nlineas;
  }

  // Fórmula para calcular la distancia entre dos coordenadas.
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
