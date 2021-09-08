import 'package:flutter/material.dart';
import 'package:flutter_kaypi/components/my_drawer.dart';

class AyudaKaypi extends StatefulWidget {
  const AyudaKaypi({Key? key}) : super(key: key);

  @override
  _AyudaKaypiState createState() => _AyudaKaypiState();
}

class _AyudaKaypiState extends State<AyudaKaypi> {
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
            child: Text('Vista de ayuda'),
          ),
        ));
  }
}
