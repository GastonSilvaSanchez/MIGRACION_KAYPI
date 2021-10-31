import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/listaLugaresTuristicos.dart';
import 'package:url_launcher/url_launcher.dart';

class CardLugar extends StatefulWidget {
  //Declaramos una variable privada _lugar de tipo objeto de la clase Lugar.
  late Lugar _lugar;

  //constructor de la clase CardLugar
  CardLugar(Lugar lugar) {
    _lugar = lugar;
  }

//En ésta línea estamos definiendo el método genérico createState().
  @override
  State<StatefulWidget> createState() {
    return CardLugarState(_lugar);
  }
}

class CardLugarState extends State<CardLugar> {
  late Lugar _lugar;

  //constructor de la clase CardLugarState
  CardLugarState(Lugar lugar) {
    _lugar = lugar;
  }

//Widget donde se muestra la interfaz de información de Lugar turístico
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent.shade400,
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
                      child: Column(
                        children: [
                          new Column(
                            children: [
                              SizedBox(height: 20),
                              //Lo que hace este código es llamar a la variable
                              // de tipo objeto de la clase Lugar que está ubicada en la página listaLugaresTuríticos,
                              //para poder visualizar la imagen del lugar turístico.
                              Hero(
                                tag: _lugar,
                                child: Image.asset(
                                  _lugar.imagen,
                                  height: 100,
                                ),
                              ),
                              SizedBox(height: 15),
                              //Lo mismo pasa con este código, llamamos a la variable que ya fue declarada.
                              //visualizamos el titulo del lugar turístico.
                              Text(
                                _lugar.titulo.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              //Creamos el botón ver ubicación que nos direccionará a google maps para ubicar el lugar turístico
                              ElevatedButton(
                                  child: Text(
                                    "Ver Ubicación",
                                    style: TextStyle(
                                        color: Colors.indigoAccent.shade400,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    launch(_lugar.ubicacion);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    animationDuration: Duration(seconds: 4),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.indigoAccent,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                   
                                    primary: Colors.white,
                                    
                                  )),
                              SizedBox(height: 20),
                            ],
                          ),
                          new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //En este Text se muestra la información o descripción del lugar turítico.
                              Text(
                                _lugar.info,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 10),
                              /* Text(
                                "Funcionalidades",
                                style: TextStyle(
                                    color: Colors.indigo.shade700,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),*/
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
                                          color: Colors.black,
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
                          //Este código lo que hace es crear el botón más información que nos direcciona a otra página,
                          //donde se muestra información mas amplia acerca del lugar turítico
                          new Column(
                            children: [
                              ElevatedButton(
                                  child: Text(
                                    "Más Información",
                                    style: TextStyle(
                                        color: Colors.indigoAccent.shade400,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    launch(_lugar.infoSitio);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    animationDuration: Duration(seconds: 4),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.indigoAccent.shade400,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                   
                                    primary: Colors.white,
                
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
    );
  }
}
