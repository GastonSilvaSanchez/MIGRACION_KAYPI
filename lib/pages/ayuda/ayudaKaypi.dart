import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AyudaKaypi extends StatefulWidget {
  const AyudaKaypi({Key? key}) : super(key: key);

  @override
  _AyudaKaypiState createState() => _AyudaKaypiState();
}

class _AyudaKaypiState extends State<AyudaKaypi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'Flutter layout demo',
        home: Scaffold(
          //drawer: MyDrawer(),
          extendBodyBehindAppBar: true,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(Icons.menu, color: Colors.grey[600], size: 28,),),),
          body: Center(
            child: Text('Vista de ayuda'),
          ),
        ));
  }
}
