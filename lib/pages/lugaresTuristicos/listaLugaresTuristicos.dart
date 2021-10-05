import 'package:flutter/material.dart';
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
  List<Lugar> elementos = new List.empty(growable: true);

  _ListaLugaresTuristicosState() {
    elementos.add(new Lugar(
        "Lugar 1",
        "Descripción 1 Descripción 1 Descripción 1 Descripción 1 Descripción 1 Descripción 1 Descripción 1 Descripción 1",
        "assets/img/lugar1.jpg"));
    elementos
        .add(new Lugar("Lugar 2", "Descripción 2", "assets/img/lugar1.jpg"));
    elementos
        .add(new Lugar("Lugar 3", "Descripción 3", "assets/img/lugar1.jpg"));
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
