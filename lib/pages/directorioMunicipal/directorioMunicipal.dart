import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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
          extendBodyBehindAppBar: true,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(Icons.menu, color: Colors.grey[600], size: 28,),),),

          body: Center(
            child: Text('Vista de Directorio'),
          ),
        ));
  }
}
