import 'package:flutter/material.dart';
import 'package:flutter_kaypi/components/my_drawer.dart';

class FormLineas extends StatefulWidget {
  const FormLineas({Key? key}) : super(key: key);

  @override
  _FormLineasState createState() => _FormLineasState();
}

class _FormLineasState extends State<FormLineas> {
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
            child: Text('Informacion de las lineas'),
          ),
        ));
  }
}
