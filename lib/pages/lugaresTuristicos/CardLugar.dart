import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/listaLugaresTuristicos.dart';
import 'package:url_launcher/url_launcher.dart';

class CardLugar extends StatefulWidget {
  //atributo
  late Lugar _lugar;

  //constructor
  CardLugar(Lugar lugar) {
    _lugar = lugar;
  }

  @override
  State<StatefulWidget> createState() {
    return CardLugarState(_lugar);
  }

}

class CardLugarState extends State<CardLugar> {

  late Lugar _lugar;

  //constructor
  CardLugarState(Lugar lugar) {
    _lugar = lugar;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          _lugar.titulo,
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
                      child:Column(
                        children: [
                          new Column(
                            children: [
                              SizedBox(height: 20),
                              Hero(
                                tag: _lugar,
                                child: Image.asset(
                                  _lugar.imagen,
                                  height: 100,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                _lugar.titulo.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.indigo.shade700,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),

                              ElevatedButton(
                                child: Text("Ver Ubicacion"),
                                onPressed: (){
                                  launch("https://www.google.com/maps/place/Palacio+Portales+de+Bolivia/@-17.3747321,-66.1517139,14z/data=!4m18!1m12!4m11!1m3!2m2!1d-66.1525514!2d-17.3750176!1m6!1m2!1s0x93e3741a0ad63119:0x1e901665fecf3f73!2sPalacio+Portales+de+Bolivia+Potosi+1392+Cochabamba+Bolivia!2m2!1d-66.1529623!2d-17.3749307!3m4!1s0x93e3741a0ad63119:0x1e901665fecf3f73!8m2!3d-17.3749307!4d-66.1529623");
                                },
                              ),
                            ],
                          ),

                          new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          
                              Text(
                                _lugar.info,
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Funcionalidades",
                                style: TextStyle(
                                    color: Colors.indigo.shade700,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              new Column(
                                  children: List.generate(
                                      _lugar.listaFuncionalidades.length,
                                      (index) {
                                return Container(
                                  child: new Column(
                                    children: [
                                      Text(
                                        _lugar.listaFuncionalidades[index]
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Hero(
                                        tag: _lugar,
                                        child: Image.asset(
                                          _lugar.listaImagenes[index],
                                          height: 280,
                                        ),
                                      ),
                                    

                                    ],

                                    
                                  ),
                                );
                              })),

                              
                            ],
                          ),

                          new Column(
                            children: [
                              ElevatedButton(
                              child: Text("Mas Informacíon"),
                                onPressed: (){
                                  launch("https://cochabambabolivia.net/atractivos-turisticos-de-cochabamba/");
                                },
                              ),
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
    );
  }
}