import 'dart:convert';
import 'package:flutter/services.dart';

class _LineasInfoProvider {

  List<dynamic> info = [];

  _LineasInfoProvider();

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('lib/utils/Lineas.json');

    Map dataMap = json.decode(resp);
    // print(dataMap['rutas']);
    info = dataMap['Lineas'];

    return info;
  }
}

final lineasInfoProvider = new _LineasInfoProvider();