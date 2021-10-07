import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/infoLugarTuristico.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/listaOpciones.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/lugar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:expandable/expandable.dart';

class ListaLugaresTuristicos extends StatefulWidget {
  ListaLugaresTuristicos({Key? key}) : super(key: key);

  @override
  _ListaLugaresTuristicosState createState() => _ListaLugaresTuristicosState();
}

class _ListaLugaresTuristicosState extends State<ListaLugaresTuristicos> {
  List<InforLugarTuristico> elementos = new List.empty(growable: true);

  _ListaLugaresTuristicosState() {
    elementos.add(new InforLugarTuristico(
        nombre: "Cristo De La Concordia",
        categoria: "Centros Turísticos",
        calles: ["Av", "de la Concordia"],
        imagen: "assets/img/lugar1.jpg",
        descripcion:
            "El Cristo de la Concordia es una colosal estatua monumental de Jasucristo que se encuentra sobre el cerro de San Pedro en la ciudad de Cochabamba, Bolivia, a una altura de 265 m sobre la ciudad."));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.indigo.shade400,
              elevation: 0,
              title: new Text('Lugares turísticos',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              leading: InkWell(
                onTap: () => ZoomDrawer.of(context)!.toggle(),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            body: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: elementos.length,
                itemBuilder: (context, index) =>
                    ListaOpciones(context, index, elementos))));
  }
}
