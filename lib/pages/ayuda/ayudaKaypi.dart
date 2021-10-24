import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/ayuda/CardInfo.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AyudaKaypi extends StatefulWidget {
  const AyudaKaypi({Key? key}) : super(key: key);

  @override
  _AyudaKaypiState createState() => _AyudaKaypiState();
}

///clase Carditem
class CardItem {
  ///atributos
  late String titulo;
  late String info;
  late String imagen;
  late List<String> listaFuncionalidades;
  late List<String> listaImagenes;

  ///contructor de la clase CardItem para insertar

  CardItem(String titulo, String info, String imagen,
      List<String> listaFuncionalidades, List<String> listaImagenes) {
    this.titulo = titulo;
    this.info = info;
    this.imagen = imagen;
    this.listaFuncionalidades = listaFuncionalidades;
    this.listaImagenes = listaImagenes;
  }
}

/// clase para la insercion de cardItems
class _AyudaKaypiState extends State<AyudaKaypi> {
  List<CardItem> elementos = new List.empty(growable: true);

  ///se define una nueva lista de la clase carditem
  _AyudaKaypiState() {
    ///se empieza a instanciar los elementos de la lista
    elementos.add(new CardItem(

        ///intancia los atributos
        "Rutas",
        "Funcionalidades sobre las posibles rutas que se pueden seleccionar.",
        "assets/img/ayudaImg/rutasayuda.png",
        [
          "Elija un punto de partida (puede ser su misma ubicación u otra diferente seleccionada del mapa).",
          "Elija un punto de destino,  y la aplicación le mostrará las líneas más cercanas que pueden llevarle a su destino.",
          "La cobertura muestra el alcance actual que tiene la aplicación."
        ],
        [
          ///hace llamdo a las imagenes a usar
          "assets/img/ayudaImg/rutas2.jpeg",
          "assets/img/ayudaImg/rutas3.jpeg",
          "assets/img/ayudaImg/rutas3.1.PNG"
        ]));
    elementos.add(new CardItem(

        ///intancia los atributos
        "Lineas",
        "Visualiza información cobre determinadas lineas de transporte.",
        "assets/img/ayudaImg/lineasayuda.png",
        [
          "Escriba parte o nombre de una línea para encontrar el resultado. Existen criterios  que permiten filtrar la búsqueda  a través de calles y tipos específicos de servicios de transporte."
        ],
        [
          ///hace llamdo a las imagenes a usar
          "assets/img/ayudaImg/lineas.jpeg"
        ]));
    elementos.add(new CardItem(

        ///intancia los atributos
        "Puntos Estrategicos",
        "Visualiza información sobre un punto estrategico especifico y sus posibles rutas.",
        "assets/img/ayudaImg/puntosestayuda.png",
        [
          "Elegido un punto estratégico es posible  determinar las líneas que pasan por dicho punto así como trazar una ruta desde su ubicación actual. La aplicación le permite crear sus propios puntos estratégicos."
        ],
        [
          ///hace llamdo a las imagenes a usar
          "assets/img/ayudaImg/puntosestrategicos1.PNG"
        ]));
    elementos.add(new CardItem(

        ///intancia los atributos
        "Configuración",
        "Modifica el aspecto de la aplicación para una mejor experiencia.",
        "assets/img/ayudaImg/configuracionayuda.png",
        [
          "Modifcar al idioma de su preferencia. \nActivar notificaciones. \nModificar privaciondad y terminos y condiciones. \nCambiar la apariencia. \nActivar o desactivar acualizaciones automaticas ."
        ],
        [
          ///hace llamdo a las imagenes a usar
          "assets/img/ayudaImg/configuracion.PNG"
        ]));
  }

  //widget de edicion del card
  Widget ListaOpciones(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardInfo(elementos[index])));

          ///muestra los elementos guardados en la lista carditem
        },

        ///se instancia los valores de configuracion del card
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.all(2.5),
          child: Container(

              /// divicion por container
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.grey,
                      Colors.indigo.shade400,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                ///divicion por filas
                children: <Widget>[
                  Hero(
                    /// se intancia una imagen a muestrar
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

  ///widget principal (build)
  @override
  Widget build(BuildContext context) {
    final orientacion = MediaQuery.of(context).orientation;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.indigo.shade600,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade600,
        elevation: 0,
<<<<<<< HEAD

        ///se establece el nombre y los detalles del titulo de la ventana
        title: new Text('Ayuda',
            style: new TextStyle(fontWeight: FontWeight.bold)),
=======
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
        leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 28,
          ),
        ),
      ),

      ///se establece el cuerppo de la ventana
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
<<<<<<< HEAD

                        ///lee y muestra las items de la lista
=======
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
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
