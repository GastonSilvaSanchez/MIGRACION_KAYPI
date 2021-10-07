import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/CardLugar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:expandable/expandable.dart';

class ListaLugaresTuristicos extends StatefulWidget {
  ListaLugaresTuristicos({Key? key}) : super(key: key);

  @override
  _ListaLugaresTuristicosState createState() => _ListaLugaresTuristicosState();
}


class Lugar {
  late String titulo;
  late String info;
  late String imagen;
  late List<String> listaFuncionalidades;
  late List<String> listaImagenes;

  Lugar(String titulo, String info, String imagen,List<String> listaFuncionalidades, List<String> listaImagenes) {
    this.titulo = titulo;
    this.info = info;
    this.imagen = imagen;
    this.listaFuncionalidades = listaFuncionalidades;
    this.listaImagenes = listaImagenes;
  }

  /*Lugar(String titulo, String info, String imagen){
    //List<String> listaFuncionalidades, List<String> listaImagenes) {
    this.titulo = titulo;
    this.info = info;
    this.imagen = imagen;
  }*/
}



class _ListaLugaresTuristicosState extends State<ListaLugaresTuristicos> {
  List<Lugar> elementos = new List.empty(growable: true);

  _ListaLugaresTuristicosState() {
    elementos.add(new Lugar(
      "Lugar 1",
      "Descripción 1",
      "assets/img/lugar1.jpg", 
      ["Elija un punto de partida (puede ser su misma ubicación u otra diferente seleccionada del mapa).",
      "Elija un punto de destino,  y la aplicación le mostrará las líneas más cercanas que pueden llevarle a su destino.",
      "La cobertura muestra el alcance actual que tiene la aplicación."], 
      ["assets/img/ayudaImg/rutas2.jpeg","assets/img/ayudaImg/rutas3.jpeg","assets/img/ayudaImg/rutas3.1.PNG"]
    ));
    elementos.add(new Lugar("Lugar 2", "Descripción 2", "assets/img/lugar1.jpg",
      ["Elija un punto de partida (puede ser su misma ubicación u otra diferente seleccionada del mapa).",
      "Elija un punto de destino,  y la aplicación le mostrará las líneas más cercanas que pueden llevarle a su destino.",
      "La cobertura muestra el alcance actual que tiene la aplicación."], 
      ["assets/img/ayudaImg/rutas2.jpeg","assets/img/ayudaImg/rutas3.jpeg","assets/img/ayudaImg/rutas3.1.PNG"
    ]));
    elementos.add(new Lugar("Lugar 3", "Descripción 3", "assets/img/lugar1.jpg",
      ["Elija un punto de partida (puede ser su misma ubicación u otra diferente seleccionada del mapa).",
      "Elija un punto de destino,  y la aplicación le mostrará las líneas más cercanas que pueden llevarle a su destino.",
      "La cobertura muestra el alcance actual que tiene la aplicación."], 
      ["assets/img/ayudaImg/rutas2.jpeg","assets/img/ayudaImg/rutas3.jpeg","assets/img/ayudaImg/rutas3.1.PNG"]
    ));
  }


  Widget ListaOpciones(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardLugar(elementos[index])));
        },
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.all(2.5),
          child: Container(
              height: 220,
              width: double.infinity,
              padding: EdgeInsets.only(left: 0, bottom: 10, top: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.grey, Colors.indigo.shade800],),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Hero(
                        tag: elementos[index],
                        child: Image.asset(
                          elementos[index].imagen,
                          width: 200,
                        ),
                      );
                      
                    }
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          child: new Column(

                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              new Expanded(
                                child: Text(
                                  elementos[index].titulo,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto"
                                  ),
                                ),
                              ),

                              new Expanded(
                                child: Text(
                                  elementos[index].info,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey.shade700,
                                    fontFamily: "Roboto"
                                  ),
                                ),
                              )
                            ],
                          )

                        );
                      }

                    ),
                    /*child: new Container(
                      padding: EdgeInsets.all(20),
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Expanded(
                            child: Text(
                              elementos[index].titulo,
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                          new Expanded(
                            child: Text(
                              elementos[index].info,
                              style: new TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey.shade700,
                                  fontFamily: "Roboto"),
                            ),
                          )
                        ],
                      ),
                    ),*/
                  ),
                ],
              )
            ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final orientacion = MediaQuery.of(context).orientation;
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.indigo.shade600,
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
                        ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: elementos.length,
                          itemBuilder: (context, index) => ListaOpciones(context, index)
                        )
                        : GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            physics: const BouncingScrollPhysics(),
                            itemCount: elementos.length,
                            itemBuilder: (context, index) => ListaOpciones(context, index),
                          ),
                  ),
                ),
              ])
      ),
    ));
  }
/*
  @override
  Widget build(BuildContext context) {
    final orientacion = MediaQuery.of(context).orientation;
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
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

            body: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: elementos.length,
                itemBuilder: (context, index) => ListaOpciones(context, index))));
  }*/
}
