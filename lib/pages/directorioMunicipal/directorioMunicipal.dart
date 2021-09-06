import 'package:flutter/material.dart';
import 'package:flutter_kaypi/components/my_drawer.dart';

class Directorio extends StatefulWidget {
  const Directorio({Key? key}) : super(key: key);

  @override
  _DirectorioState createState() => _DirectorioState();
}

class _DirectorioState extends State<Directorio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text('Flutter layout demo'),
          ),
          body: Center(
            child: Text('Vista de Directorio'),
          ),
        ));
  }
}
