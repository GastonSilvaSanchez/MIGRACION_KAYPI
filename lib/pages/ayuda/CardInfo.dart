import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/Routes/ruta.dart';
import 'package:flutter_kaypi/pages/ayuda/ayudaKaypi.dart';

class CardInfo extends StatefulWidget 
{
  //atributo
  late CardItem _cardItem;

  //constructor
  CardInfo(CardItem cardItem){

    _cardItem = cardItem;
  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardInfoState(_cardItem);
  }
}

class CardInfoState extends State<CardInfo> {

  //atributo
  late CardItem _cardItem;

  //constructor
  CardInfoState(CardItem cardItem){
    _cardItem = cardItem;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      //editar colores
      appBar: AppBar(
        title: Text(_cardItem.titulo, style: TextStyle(color: Colors.grey.shade400),),
        backgroundColor: Colors.indigo.shade800,
      ),

      //editar cuerpo de la vista colocar una imagen y la informacion
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index){
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20,),

                          Hero(tag: _cardItem, child: Image.asset(_cardItem.imagen, height: 290,),),

                          SizedBox(height: 50,),

                          Text(_cardItem.info, style: TextStyle(color: Colors.indigo.shade800, fontSize: 18.0),),
                        ],
                      ),
                    )
                  );
                },
              ),
            )
            
          ],
        ),
        
      ),
    );
  }
}