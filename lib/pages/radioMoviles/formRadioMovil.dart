import 'package:flutter/material.dart';
//import 'package:flutter_kaypi/components/my_drawer.dart';

class FormRadioMovil extends StatefulWidget {
  const FormRadioMovil({Key? key}) : super(key: key);

  @override
  _FormRadioMovilState createState() => _FormRadioMovilState();
}

class _FormRadioMovilState extends State<FormRadioMovil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'Flutter layout demo',
        home: Scaffold(
          //drawer: MyDrawer(),
          
          body: Center(
            child: Text('Informacion de radio moviles'),
          ),
        ));
  }
}
