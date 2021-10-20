import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/listaLugaresTuristicos.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CardLugar extends StatefulWidget {
  late String _lugar;
  CardLugar(String lugar) {
    _lugar = lugar;
  }
  @override
  State<StatefulWidget> createState() {
    return CardLugarState(_lugar);
  }
}

class CardLugarState extends State<CardLugar> {
  late String _lugar;
  late Map data = new Map();
  List dataInformacion = [];
  CardLugarState(String lugar) {
    _lugar = lugar;
  }

  getLugaresTuristicos() async {
    //http.Response response = await http.get(Uri.parse('http://10.0.2.2:4000/api/lugares/'+_lugar));
    http.Response response = await http
        .get(Uri.parse('http://localhost:4000/api/lugares/' + _lugar));

    setState(() {
      data = json.decode(response.body);
      dataInformacion = data['informacion'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLugaresTuristicos();
  }

  //Widget donde se muestra la interfaz de información de Lugar turístico
  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              elevation: 0,
              title: Text(
                data['titulo'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            child: Column(
                              children: [
                                new Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Hero(
                                      tag: data,
                                      child: Image.network(
                                        data['portada'],
                                        height: 100,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      data['titulo'].toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.indigo.shade700,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                        child: Text(
                                          "Ver Ubicación",
                                          style: TextStyle(
                                              color:
                                                  Colors.indigoAccent.shade400,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          launch(data["ubicacion"]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          animationDuration:
                                              Duration(seconds: 4),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors
                                                      .indigoAccent.shade400,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          elevation: 18,
                                          primary: Colors.transparent,
                                          shadowColor: Colors.grey.shade400,
                                        )),
                                    SizedBox(height: 20),
                                  ],
                                ),
                                new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Caegoria: " + data['categoria'],
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Una breve descripción",
                                      style: TextStyle(
                                          color: Colors.indigo.shade700,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    new Column(
                                        children: List.generate(
                                            dataInformacion.length, (index) {
                                      return Container(
                                        child: new Column(
                                          children: [
                                            Text(
                                              dataInformacion[index].toString(),
                                              style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      );
                                    }))
                                  ],
                                ),
                                new Column(
                                  children: [
                                    ElevatedButton(
                                        child: Text(
                                          "Más Información",
                                          style: TextStyle(
                                              color:
                                                  Colors.indigoAccent.shade400,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          launch(data["sitioWeb"]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          animationDuration:
                                              Duration(seconds: 4),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors
                                                      .indigoAccent.shade400,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          elevation: 18,
                                          primary: Colors.transparent,
                                          shadowColor: Colors.grey.shade400,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold();
  }
}
