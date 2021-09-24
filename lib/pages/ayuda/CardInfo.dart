import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/Routes/ruta.dart';
import 'package:flutter_kaypi/pages/ayuda/ayudaKaypi.dart';

class CardInfo extends StatefulWidget {
  //atributo
  late CardItem _cardItem;

  //constructor
  CardInfo(CardItem cardItem) {
    _cardItem = cardItem;
  }

  @override
  State<StatefulWidget> createState() {
    return CardInfoState(_cardItem);
  }
}

class CardInfoState extends State<CardInfo> {
  late CardItem _cardItem;

  CardInfoState(CardItem cardItem) {
    _cardItem = cardItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          _cardItem.titulo,
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
                                tag: _cardItem,
                                child: Image.asset(
                                  _cardItem.imagen,
                                  height: 100,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                _cardItem.titulo.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.indigo.shade700,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                          new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _cardItem.info,
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
                                      _cardItem.listaFuncionalidades.length,
                                      (index) {
                                return Container(
                                  child: new Column(
                                    children: [
                                      Text(
                                        _cardItem.listaFuncionalidades[index]
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Hero(
                                        tag: _cardItem,
                                        child: Image.asset(
                                          _cardItem.listaImagenes[index],
                                          height: 280,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }))
                            ],
                          )
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
