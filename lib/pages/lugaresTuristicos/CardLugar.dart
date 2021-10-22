
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
      backgroundColor: Colors.indigo.shade600,
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
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),

                              ElevatedButton(
                                child: Text("Ver Ubicación", style: TextStyle(color: Colors.indigoAccent.shade400, fontSize: 18, fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  launch(_lugar.ubicacion);
                                },
                                style: ElevatedButton.styleFrom(
                                  animationDuration: Duration(seconds: 4),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.indigoAccent.shade400, width: 2), borderRadius: BorderRadius.circular(15)),
                                  elevation: 18,
                                  primary: Colors.transparent,
                                  shadowColor: Colors.grey.shade400,
                                )
                              ),

                              SizedBox(height: 20),
                            ],
                          ),

                          new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          
                              Text(
                                _lugar.info,
                                style: TextStyle(
                                  color: Colors.white,
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
                                          color: Colors.white,
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
                              child: Text("Más Información", style: TextStyle(color: Colors.indigoAccent.shade400, fontSize: 18, fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  launch(_lugar.infoSitio);
                                },

                                style: ElevatedButton.styleFrom(
                                  animationDuration: Duration(seconds: 4),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.indigoAccent.shade400, width: 2), borderRadius: BorderRadius.circular(15)),
                                  elevation: 18,
                                  primary: Colors.transparent,
                                  shadowColor: Colors.grey.shade400,
                                )
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