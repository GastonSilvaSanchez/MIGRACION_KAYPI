import 'dart:convert';
import 'package:flutter/services.dart';

class _PuntosEstrategicosProvider {

  List<dynamic> info = [];

  _PuntosEstrategicosProvider();

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('lib/utils/PuntosEstrategicos.json');

    Map dataMap = json.decode(resp);
    // print(dataMap['rutas']);
    info = dataMap['PuntosEstrategicos'];

    return info;
  }
}

final puntosEstrategicosProvider = new _PuntosEstrategicosProvider();