import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FormPuntosPersonalizados extends StatefulWidget {
  const FormPuntosPersonalizados({Key? key}) : super(key: key);

  @override
  _FormPuntosPersonalizadosState createState() =>
      _FormPuntosPersonalizadosState();
}

class _FormPuntosPersonalizadosState extends State<FormPuntosPersonalizados> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KAYPI',
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () => ZoomDrawer.of(context)!.toggle(),
              child: Icon(
                Icons.menu,
                color: Colors.grey[600],
                size: 28,
              ),
            ),
          ),
          body: Center(
            child: Text('Lista de puntos estrategicos Personalizados'),
          ),
        ));
  }
}
