/// Nombre de la aplicación: listaLugaresTuristicos
/// Nombre del desarrollador: Axel Miranda, Carolina Escobar, Noemi Sanchez
/// Fecha de creación: 20/10/2021
import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/CardLugar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//import 'package:expandable/expandable.dart';

//Los widgets stateful heredan de la clase StatefulWidget.
//La clase ListaLugaresTuristicos administra su propio estado,
//sobreescribiendo el método createState() para crear el objeto State.
class ListaLugaresTuristicos extends StatefulWidget {
  //Se coloca una clave porque la clase hereda a la clase StatefulWidget, es decir,
  // cuando se maneja un estado(State)
  ListaLugaresTuristicos({Key? key}) : super(key: key);

//El framework llama a createState() cuando quiere construir el widget.
//En este código, createState() crea una instancia de _ListaLugaresTuristicosState
  @override
  _ListaLugaresTuristicosState createState() => _ListaLugaresTuristicosState();
}

//Se creó la clase Lugar para operar sobre estos campos(variables)
//los datos del json(que contiene la información de los lugares turísticos).
class Lugar {
  late String titulo;
  late String info;
  late String imagen;
  late List<String> listaFuncionalidades;
  late List<String> listaImagenes;
  late String infoSitio;
  late String ubicacion;

//Constructor de la clase Lugar
  Lugar(
      String titulo,
      String info,
      String imagen,
      List<String> listaFuncionalidades,
      List<String> listaImagenes,
      String infoSitio,
      String ubicacion) {
    this.titulo = titulo;
    this.info = info;
    this.imagen = imagen;
    this.listaFuncionalidades = listaFuncionalidades;
    this.listaImagenes = listaImagenes;
    this.infoSitio = infoSitio;
    this.ubicacion = ubicacion;
  }
  /*Lugar(String titulo, String info, String imagen){
    //List<String> listaFuncionalidades, List<String> listaImagenes) {
    this.titulo = titulo;
    this.info = info;
    this.imagen = imagen;
  }*/
}

//Clase donde se establecen los valores estáticos para mostrarlos en la interfaz de
//información de lugares turísticos
class _ListaLugaresTuristicosState extends State<ListaLugaresTuristicos> {
  //Enviar los valores a la clase Lugar en forma de lista
  List<Lugar> elementos = new List.empty(growable: true);

//Constructor donde se envian los valores o elementos a una lista
  _ListaLugaresTuristicosState() {
    elementos.add(new Lugar(
        "Cristo de la Concordia",
        "El cristo de la concordia es considerada la estatuta de Jesús mas grande que existe",
        "assets/img/lugaresTuristicosImg/cristo2.jpg",
        [
          /*"La estatua fue realizada por los escultores y arquitectos cochabambinos, los hermanos César y Walter Terrazas Pardo",
        "La estatua mide 34,20 metros de altura, sobre un pedestal de 6,24 metros, con una altura total de 40,44 m.",
        "Se encuentra sobre el cerro de San Pedro en la ciudad de Cochabamba, Bolivia,"*/
        ],
        ["assets/img/lugaresTuristicosImg/cristo.jpg"],
        "https://cochabambabolivia.net/atractivos/cristo-de-la-concordia/",
        "https://www.google.com/maps/place/Monumento+Cristo+de+la+Concordia/@-17.384351,-66.134977,16z/data=!4m5!3m4!1s0x0:0x2732d0d1aee659ff!8m2!3d-17.3843417!4d-66.1349253?hl=es"));

    elementos.add(new Lugar(
        "Plaza 14 de Septiembre",
        "La plaza principal 14 de Septiembre fue escenario de la segunda fundación de Cochabamba",
        "assets/img/lugaresTuristicosImg/plaza1.jpg",
        [
          /*"Corresponde a la tipología de plaza mayor o de armas, espacios urbanos característicos de los trazados hispanoamericanos,",
        "La plaza lleva el nombre de la fecha en que la ciudad se independizó de España.",
        "La rodean la Catedral, la Gobernación, la Municipalidad, otros organismos estatales y negocios particulares."*/
        ],
        [
          "assets/img/lugaresTuristicosImg/plaza2.jpg",
          "assets/img/lugaresTuristicosImg/plaza3.jpg"
        ],
        "https://cochabambabolivia.net/atractivos/plaza-14-de-septiembre/",
        "https://www.google.com/maps/place/Pl.+14+de+Septiembre.,+Cochabamba,+Bolivia/@-17.3935053,-66.1563054,17.93z/data=!4m13!1m7!3m6!1s0x93e373f657a099d5:0xda6f3efcd4738ba7!2sPl.+14+de+Septiembre.,+Cochabamba,+Bolivia!3b1!8m2!3d-17.3932385!4d-66.1565377!3m4!1s0x93e373f657a099d5:0xda6f3efcd4738ba7!8m2!3d-17.3932385!4d-66.1565377?hl=es-US"));

    elementos.add(new Lugar(
        "Palacio Portales",
        "Ubicado en la zona Queru Queru, el Palacio Portales fue construido entre 1915 y 1927",
        "assets/img/lugaresTuristicosImg/foto1.jpg",
        [
          /*"El arquitecto francés Eugène Bliault diseñó el proyecto del Palacio, y fue ejecutado empleando mano de obra artesanal y utilizando materiales de construcción traídos de Europa",
        "El Palacio es un ejemplo de estilo ecléctico, que respondía a comienzos del Siglo XX al gusto de las élites europeas.",
        "Sus jardines fueron diseñados por expertos japoneses"*/
        ],
        [
          "assets/img/lugaresTuristicosImg/foto2.jpg",
          "assets/img/lugaresTuristicosImg/foto3.jpg"
        ],
        "https://centropatino.fundacionpatino.org/areas/palacio-portales/",
        "https://www.google.com/maps/place/Palacio+Portales+de+Bolivia/@-17.374943,-66.15282,14z/data=!4m5!3m4!1s0x0:0x1e901665fecf3f73!8m2!3d-17.3749307!4d-66.1529623?hl=es-US"));

    elementos.add(new Lugar(
        "Catedral Metropolitana",
        "Geográficamente la Catedral Metropolitana de San Sebastián de Cochabamba, tiene un lugar privilegiado entre los edificios más importantes de la ciudad",
        "assets/img/lugaresTuristicosImg/catedral2.jpg",
        [
          /*"La iglesia fue reedificada en dos ocasiones: 1619 y 1701, definiéndose la forma que actualmente tiene.",
        "En 1830 se añadieron las naves laterales y en 1925 se incorporó la galería que da a la Iglesia.",
        "Fue nombrada metropolitana en 1975"*/
        ],
        [
          "assets/img/lugaresTuristicosImg/catedral1.jpg",
          "assets/img/lugaresTuristicosImg/catedral3.jpg"
        ],
        "https://cochabambabolivia.net/atractivos/catedral-metropolitana/",
        "https://www.google.com/maps/place/Catedral+Metropolitana+de+San+Sebasti%C3%A1n/@-17.3943615,-66.1566811,21z/data=!4m19!1m13!4m12!1m4!2m2!1d-63.2149994!2d-17.8123755!4e1!1m6!1m2!1s0x93e373f6e3a55555:0x3ffc7924cd327dab!2scatedral+metropolitana+de+cochabamba!2m2!1d-66.1568054!2d-17.3943143!3m4!1s0x93e373f6e3a55555:0x3ffc7924cd327dab!8m2!3d-17.3943143!4d-66.1568054"));

    elementos.add(new Lugar(
        "Parque de la Familia",
        "Ubicado en la avenida Costanera, al noreste de la ciudad",
        "assets/img/lugaresTuristicosImg/fot2.jpg",
        [
          "Recientemente fue remozado con una importante inversion para consolidarse como nuevo escenario turistico",
          "Donde destacan las 5 fuentes de Aguas Danzantes",
          "Con proyección de imágenes  en el agua, videos, luces LED multicolores y disparos de liquidos"
        ],
        [
          "assets/img/lugaresTuristicosImg/parque2.jpg",
          "assets/img/lugaresTuristicosImg/parque3.jpg",
          "assets/img/lugaresTuristicosImg/fot1.jpg",
          "assets/img/lugaresTuristicosImg/fot3.jpg"
        ],
        "https://cochabambabolivia.net/parques-recreativos/",
        "https://www.google.com/maps/place/Parque+De+la+Familia/@-17.3866244,-66.1627752,19.85z/data=!4m19!1m13!4m12!1m4!2m2!1d-63.2149994!2d-17.8123755!4e1!1m6!1m2!1s0x93e3740b9cf67133:0x637b2a0ff714f1d6!2sparque+de+la+familia+cochabamba!2m2!1d-66.1628018!2d-17.386378!3m4!1s0x93e3740b9cf67133:0x637b2a0ff714f1d6!8m2!3d-17.386378!4d-66.1628018"));

    elementos.add(new Lugar(
        "Parque Mariscal Santa Cruz",
        "Se destaca como el espacio recreativo mas grande de la cuidad de Cochabamba.",
        "assets/img/lugaresTuristicosImg/acu2.jpg",
        [
          /*"El objetivo de su creación fue la sensibilización ciudadana, recuperación y preservación del medio ambiente",
        "Su infraestructura deportiva consta de canchas poli funcionales, ideales para la práctica de basket, \nvolley ball y fútbol de salón.",
        "Centro de recreación y esparcimiento con piscina, entornos naturales, diferentes juegos recreativos, \nbotes acuáticos a pedal, además del museo subterráneo."*/
        ],
        [
          "assets/img/lugaresTuristicosImg/acu1.jpg",
          "assets/img/lugaresTuristicosImg/acu3.jpg"
        ],
        "https://cochabambabolivia.net/parques-recreativos/",
        "https://www.google.com/maps/place/Mariscal+Santa+Cruz/@-17.4007564,-66.1745026,18.12z/data=!4m12!1m6!3m5!1s0x0:0x51486ed3d15fd204!2sMariscal+Santa+Cruz!8m2!3d-17.4005556!4d-66.1741667!3m4!1s0x0:0x51486ed3d15fd204!8m2!3d-17.4005556!4d-66.1741667"));
  }

//Este Widget muestra una lista de opciones de los lugares turísticos registrados.
  Widget ListaOpciones(BuildContext context, int index) {
    //Retornamos un GestureDetector, que nos sirve para hacer una interacción con el usuario,
    //es decir que le damos al widget la capacidad de poder detectar un click(en este caso,
    //detectar un click en un card).
    return GestureDetector(
        onTap: () {
          //Este código lo que hace es navegar a la página CardLugar,
          // donde se encuentra la interfaz de información de un lugar turítico.
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardLugar(elementos[index])));
        },
        //Definimos un card(una tarjeta donde se visualizará un lugar turístico,
        //que presionando el card nos direccionará a la página de interfaz de información de un lugar turítico).
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.all(2.5),
          //falta detallar
          child: Container(
              height: 200,
              width: 100,
              padding: EdgeInsets.only(left: 0, bottom: 10, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: elementos[index],
                    child: Image.asset(
                      elementos[index].imagen,
                      
                      //height: 100,
                      width: 150,
                      
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
                              elementos[index].titulo,
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
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

//Este widget build lo que hace es construir un espacio,
//donde se mostrará los cards de las listas de lugares turísticos
  @override
  Widget build(BuildContext context) {
    //Ésta línea de código hará que el widget se construya automáticamente, es decir que su proporción
    //en la intefaz de usuario se controlará(es como un size).
    final orientacion = MediaQuery.of(context).orientation;

    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.indigo.shade800,
      extendBodyBehindAppBar: true,
      //Este Código AppBar, es el menú de navegabilidad
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      // Todo lo que esta dentro del body es el codigo que maneja las columnas, en este caso dos,
      //para el despliegue de los cards que contienen una breve descripción de un lugar turítico.
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
                            itemCount: elementos.length,
                            itemBuilder: (context, index) =>
                                ListaOpciones(context, index))
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            physics: const BouncingScrollPhysics(),
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
