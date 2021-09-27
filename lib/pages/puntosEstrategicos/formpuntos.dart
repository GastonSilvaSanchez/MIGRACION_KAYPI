import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class FormPuntos extends StatefulWidget {
  const FormPuntos({Key? key}) : super(key: key);

  @override
  _FormPuntosState createState() => _FormPuntosState();
}

class _FormPuntosState extends State<FormPuntos> {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "PUNTOS ESTRATEGICOS",),
                Tab(text: "MIS PUNTOS",),                
              ],
            ),
            title: Text('Puntos estrategicos'),
          ),
          body: const TabBarView(
            children: [
              //Agregar contenido o redirecionamiento aca
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
            ],
          ),
        ), 
      ),  
    );
  }
}
