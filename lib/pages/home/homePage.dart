import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_kaypi/pages/Routes/routesPage.dart';
import 'package:flutter_kaypi/pages/Routes/ruta.dart';

//referencia a la vista ventana_prueba en pages

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  //final zoomDrawerController;

  //HomePage(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        //menu lateral
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => ZoomDrawer.of(context)!.toggle(),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 50, bottom: 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey,
                  Colors.indigo.shade400,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/img/KaypiLogo.png',
                        //width: MediaQuery.of(context).size.width / 2,
                        height: 220,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 40),
                    ),
                    Text(
                      '¿Que Linea Tomar? ¿Donde Bajar?',
                      style: TextStyle(
                        color: Colors.white70,
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
                        color: Colors.white70,
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
                        color: Colors.white70,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
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
                        fixedSize: Size(200, 40),
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
