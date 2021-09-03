import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/ventana_prueba.dart'; //referencia a la vista ventana_prueba en pages

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({Key? key}) : super(key: key);

  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          /*title: Text(
            'Bienvenido a Kaypi',
            style: TextStyle(color: Colors.blueAccent),
          ),
          centerTitle: true,*/
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey,
                  Colors.blue,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*Padding(
                      padding: EdgeInsets.only(top: 110),
                    ),*/
                    Center(
                      child: Image.asset(
                        'assets/img/KaypiLogo.png',
                        width: MediaQuery.of(context).size.width / 2,
                        height: 200,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    Text(
                      '¿Que Linea Tomar? ¿Donde Bajar?',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Disfruta y siente la comodidad de elegir',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'como llegar a tu destino',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    //aca realiza el boton para ingresar a la siguiente vista
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewScreen();
                            },
                          ),
                        );
                      },
                      child: const Text('Acceder'),
                    ),
                  ],
                ),
              ],
            )));
  }
}
