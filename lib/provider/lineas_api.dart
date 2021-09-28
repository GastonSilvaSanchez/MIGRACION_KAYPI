import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:http/http.dart' as http;

class LineasApi {
  List<Linea> info = [];

  LineasApi();

  //Metodo cargarData()
  //Obtiene de un json localmente y retorna una lista parseo Json
  Future<List<Linea>> cargarData() async {
    final listJson = 'lib/utils/Lineas.json';
    final response = await rootBundle.loadString(listJson);
    final data = await json.decode(response);
    final list = data['Lineas'] as List<dynamic>;

    list.sort((a, b) => a.toString().compareTo(b.toString()));

    return info = list.map((e) => Linea.fromJson(e)).toList();
  }

  //Metodo getLineas()
  //Obtiene de una url el json y retorna una lista parseo Json
  /*
  Future<List<Linea>> getLineas() async {
    final url = 'Here your line link url json';
    final response = await http.get(url);
    final body = await json.decode(response.body);
    final list = body['Lineas'] as List<dynamic>;

    return info = list.map((e) => Linea.fromJson(e)).toList();
  }
  */
}

final lineasApi = new LineasApi();