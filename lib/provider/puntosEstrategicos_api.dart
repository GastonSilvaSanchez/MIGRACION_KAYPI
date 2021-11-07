import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_kaypi/pages/model/puntoEstrategico.dart';
import 'package:http/http.dart' as http;

class PuntoEstrategicoApi {
  List<PuntoEstrategico> info = [];

  PuntoEstrategicoApi();

  //Metodo cargarData()
  /*Obtiene de un json localmente y retorna una lista parseo Json
  Future<List<Linea>> cargarData() async {
    final listJson = 'lib/utils/Lineas.json';
    final response = await rootBundle.loadString(listJson);
    final data = await json.decode(response);
    final list = data['Lineas'] as List<dynamic>;

    //list.sort((a, b) => a.toString().compareTo(b.toString()));
    
    return info = list.map((e) => Linea.fromJson(e)).toList();
  }

  //Metodo getLineas()
  //Obtiene de una url el json y retorna una lista parseo Json
  */
  Future<List<PuntoEstrategico>> cargarData() async {
    //http.Response response = await http.get(Uri.parse('http://10.0.2.2:3000/api/puntos'));
    http.Response response = await http.get(Uri.parse('https://swanky-buttoned-saltasaurus.glitch.me/api/puntos'));
    final body = await json.decode(response.body);

    final list = body['puntosEstrategicos'] as List<dynamic>;

    return info = list.map((e) => PuntoEstrategico.fromJson(e)).toList();
  }
  
}

final puntoEstrategicoApi = new PuntoEstrategicoApi();