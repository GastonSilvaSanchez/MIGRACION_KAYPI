import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/ayuda/CardInfo.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AyudaKaypi extends StatefulWidget {
  const AyudaKaypi({Key? key}) : super(key: key);

  @override
  _AyudaKaypiState createState() => _AyudaKaypiState();
}

class CardItem {
  late String titulo;
  late String info;
  late String imagen;
  late List<String> listaFuncionalidades;
  late List<String> listaImagenes;

  CardItem(String titulo, String info, String imagen,
      List<String> listaFuncionalidades, List<String> listaImagenes) {
    this.titulo = titulo;
    this.info = info;
    this.imagen = imagen;
    this.listaFuncionalidades = listaFuncionalidades;
    this.listaImagenes = listaImagenes;
  }
}

class _AyudaKaypiState extends State<AyudaKaypi> {
  List<CardItem> elementos = new List.empty(growable: true);
  _AyudaKaypiState() {
    elementos.add(new CardItem(
        "Rutas",
        "Funcionalidades sobre las posibles rutas que se pueden seleccionar.",
        "assets/img/ayudaImg/rutasayuda.png", [
      "Elija un punto de partida (puede ser su misma ubicación u otra diferente seleccionada del mapa).",
      "Elija un punto de destino,  y la aplicación le mostrará las líneas más cercanas que pueden llevarle a su destino.",
      "La cobertura muestra el alcance actual que tiene la aplicación."
    ], [
      "assets/img/ayudaImg/rutas2.jpeg",
      "assets/img/ayudaImg/rutas3.jpeg",
      "assets/img/ayudaImg/rutas3.1.PNG"
    ]));
    elementos.add(new CardItem(
        "Lineas",
        "Visualiza información cobre determinadas lineas de transporte.",
        "assets/img/ayudaImg/lineasayuda.png", [
      "Escriba parte o nombre de una línea para encontrar el resultado. Existen criterios  que permiten filtrar la búsqueda  a través de calles y tipos específicos de servicios de transporte."
    ], [
      "assets/img/ayudaImg/lineas.jpeg"
    ]));
    elementos.add(new CardItem(
        "Puntos Estrategicos",
        "Visualiza información sobre un punto estrategico especifico y sus posibles rutas.",
        "assets/img/ayudaImg/puntosestayuda.png", [
      "Elegido un punto estratégico es posible  determinar las líneas que pasan por dicho punto así como trazar una ruta desde su ubicación actual. La aplicación le permite crear sus propios puntos estratégicos."
    ], [
      "assets/img/ayudaImg/puntosestrategicos1.PNG"
    ]));
    elementos.add(new CardItem(
        "Configuración",
        "Modifica el aspecto de la aplicación para una mejor experiencia.",
        "assets/img/ayudaImg/configuracionayuda.png", [
      "Modifcar el idioma . \nActivar notificaciones. \nModificar privaciondad y terminos y condiciones. \nCambiar la apariencia. \nActivar o desactivar acualizaciones automaticas ."
    ], [
      "assets/img/ayudaImg/configuracion.PNG"
    ]));
  }

  //editar card
  Widget ListaOpciones(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardInfo(elementos[index])));
        },
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.all(2.5),
          child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.indigo.shade100],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: elementos[index],
                    child: Image.asset(
                      elementos[index].imagen,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Expanded(
                    child: new Container(
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
                                  fontSize: 18.0,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto"),
                            ),
                          ),
                          new Expanded(
                            child: Text(
                              elementos[index].info,
                              style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey.shade700,
                                  fontFamily: "Roboto"),
                            ),
                          )
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
    final orientacion = MediaQuery.of(context).orientation;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: new Text('Ayuda',
            style: new TextStyle(fontWeight: FontWeight.bold)),
        leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(
            Icons.menu,
            color: Colors.white,
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
                    child: orientacion == Orientation.portrait
                        ? ListView.builder(
                            itemCount: elementos.length,
                            itemBuilder: (context, index) =>
                                ListaOpciones(context, index))
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: elementos.length,
                            itemBuilder: (context, index) =>
                                ListaOpciones(context, index),
                          ),
                  ),
                ),
              ])),
    ));
  }
}
