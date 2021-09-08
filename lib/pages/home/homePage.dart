import 'package:flutter/material.dart';
import 'package:flutter_kaypi/components/my_drawer.dart';
import 'package:flutter_kaypi/pages/Routes/routesPage.dart';

//referencia a la vista ventana_prueba en pages

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: MyDrawer(),
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
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/img/KaypiLogo.png',
                        //width: MediaQuery.of(context).size.width / 2,
                        height: 250,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 50),
                    ),
                    Text(
                      '¿Que Linea Tomar? ¿Donde Bajar?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                    ),
                    Text(
                      'Disfruta y siente la comodidad de elegir',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                    ),
                    Text(
                      'como llegar a tu destino',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 150),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.SPLASH);
                      },
                      child: const Text(
                        'ACCEDER',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
