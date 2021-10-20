import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/CardLugar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ListaLugaresTuristicos extends StatefulWidget {
  ListaLugaresTuristicos({Key? key}) : super(key: key);

  @override
  _ListaLugaresTuristicosState createState() => _ListaLugaresTuristicosState();
}

class _ListaLugaresTuristicosState extends State<ListaLugaresTuristicos> {
  Map elements = new Map();
  List listElements = new List.empty(growable: true);

  getLugaresTuristicos() async {
    // http.Response response =
    //   await http.get(Uri.parse('http://10.0.2.2:4000/api/lugares'));
    http.Response response =
        await http.get(Uri.parse('http://localhost:4000/api/lugares'));
    elements = json.decode(response.body);

    setState(() {
      listElements = elements['lugares'];
    });
  }

  @override
  void initState() {
    super.initState();
    getLugaresTuristicos();
  }

  Widget ListaOpciones(BuildContext context, int index) {
    //Retornamos un GestureDetector, que nos sirve para hacer una interacción con el usuario,
    //es decir que le damos al widget la capacidad de poder detectar un click(en este caso,
    //detectar un click en un card).
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CardLugar(listElements[index]["_id"].toString())));
        },
        //Definimos un card(una tarjeta donde se visualizará un lugar turístico).
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.all(2.5),
          //falta detallar
          child: Container(
              height: 340,
              width: double.infinity,
              padding: EdgeInsets.only(left: 0, bottom: 10, top: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey, Colors.indigo.shade800],
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: listElements[index],
                    child: Image.network(
                      listElements[index]['portada'],
                      //height: 100,
                      width: double.infinity,
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      padding: EdgeInsets.all(10),
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Expanded(
                            child: Text(
                              listElements[index]['titulo'],
                              //"${listElements[index]["titulo"]}",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //Ésta línea de código hará que el widget se construya automáticamente, es decir que su proporción
    //en la intefaz de usuario se controlará(es como un size).
    final orientacion = MediaQuery.of(context).orientation;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.indigo.shade800,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 28,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 2),
                    transitionBuilder: (widget, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: widget,
                      );
                    },
                    child: orientacion == Orientation.landscape
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            physics: const BouncingScrollPhysics(),
                            itemCount: listElements.length,
                            itemBuilder: (context, index) =>
                                ListaOpciones(context, index))
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            physics: const BouncingScrollPhysics(),
                            itemCount: listElements.length,
                            itemBuilder: (context, index) =>
                                ListaOpciones(context, index),
                          ),
                  ),
                ),
              ])),
    ));
  }
}
