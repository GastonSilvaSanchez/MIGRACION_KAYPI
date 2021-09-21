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
        title: 'Flutter layout demo',
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(Icons.menu, color: Colors.grey[600], size: 28,),),),
          
          body: Center(
            child: Text('Vista de puntos estrategicos'),
          ),
        ));
  }
}
