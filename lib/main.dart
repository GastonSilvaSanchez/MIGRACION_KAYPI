import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/pantalla_portada.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaypi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaInicio(),
    );
  }
}
