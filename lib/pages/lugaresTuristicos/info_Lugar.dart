import 'dart:convert';

import 'package:flutter/services.dart';
//import 'package:flutter_kaypi/pages/lugaresTuristicos/linea.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/infoLugarTuristico.dart';

class InfoLugar {
  List<InforLugarTuristico> info = [];

  InfoLugar();

  //Metodo cargarData()
  //Obtiene de un json localmente y retorna una lista parseo Json
  Future<List<InforLugarTuristico>> cargarData() async {
    final listJson = 'lib/utils/Lineas.json';
    final response = await rootBundle.loadString(listJson);
    final data = await json.decode(response);
    final list = data['Lineas'] as List<dynamic>;

    return info = list.map((e) => InforLugarTuristico.fromJson(e)).toList();
  }
}

final infoLugarT = new InfoLugar();
