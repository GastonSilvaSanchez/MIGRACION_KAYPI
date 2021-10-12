import 'package:flutter/material.dart';
import 'package:flutter_kaypi/routes/routes_page.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/images/cbba_bg.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Container(
                              width: 180,
                              height: 180,
                              color: Color(0xff033456),
                              alignment: Alignment.center,
                              child: ImageIcon(
                                AssetImage('assets/images/splash.png'),
                                color: Colors.white,
                                size: 130,
                              )),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text('Bienvenido/a',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 40),
                      Text(
                          'Que linea Tomar? Donde Bajar?.\nDisfruta y siente la comodidad de elegir \ncomo llegar a tu destino',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 40),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.MENU);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Color(0xff033456),
                          padding: EdgeInsets.all(25),
                          child: Text('EMPEZAR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                )
              ],
            )));
  }
}
