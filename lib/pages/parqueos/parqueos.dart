import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Parqueos extends StatefulWidget {
  const Parqueos({Key? key}) : super(key: key);

  @override
  _ParqueosState createState() => _ParqueosState();
}

class _ParqueosState extends State<Parqueos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'Flutter layout demo',
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(Icons.menu, color: Colors.grey[600], size: 28,),),),
          body: Center(
            child: Text('Informacion sobre el parqueo'),
          ),
        ));
  }
}
