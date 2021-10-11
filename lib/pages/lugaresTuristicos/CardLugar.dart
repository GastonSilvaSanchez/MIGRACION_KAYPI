import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/listaLugaresTuristicos.dart';

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