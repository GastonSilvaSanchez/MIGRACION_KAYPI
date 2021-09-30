import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        //backgroundColor: Colors.white,
        appBar: AppBar(
          ///Agregado
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              //Insertar opciones de interfaz
            },
          ),
          title: Text('Acerca de...'),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          backgroundColor: Colors.blue[200],
          elevation: 0.0,

          ///Agregado
          // title: Text('Cards Prueba'),
        ),
        body: ListView(
          //padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),

          children: <Widget>[
            ////Agregado

            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                'Kaypi',
                style: TextStyle(
                    color: Colors.blue[700],
                    letterSpacing: 2.0,
                    //Fuente de Prueba puede ser intercambiable:
                    fontFamily: 'AlfaSlabOne',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            /*Center(
              child: Text(
                'Kaypi\n',
                style: TextStyle(
                    color: Colors.blue[700],
                    letterSpacing: 2.0,
                    //Fuente de Prueba puede ser intercambiable:
                    fontFamily: 'AlfaSlabOne',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ),*/
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                //Logo de prueba:
                'assets/univalle.png',
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                '\n',
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Versión 2.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                  letterSpacing: 2.0,
                ),
              ),
            ),
            ////Agregado
            ///
            /*FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: AssetImage('assets/descarga.png'),
              height: 140,
            ),*/

            miCard(),
            miCard2(),
            ////Agregado
            Divider(
              height: 90.0,
              color: Colors.grey[600],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Otras Aplicaciones',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ////Agregado
            miCard3(),
            miCardDesign(),
          ],
        ));
  }

  Card miCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text("       "),
              ),
              FadeInImage(
                alignment: Alignment.centerRight,
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/descargacocha.png'),
                height: 40,
                width: 40,
              ),
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(5, 10, 60, 5),
                child: Text(
                    "Contribuciones\n\nGobierno Autónomo Municipal de Cochabamba"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Card miCard2() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text("       "),
              ),
              FadeInImage(
                alignment: Alignment.centerRight,
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/univalle.png'),
                height: 40,
                width: 40,
              ),
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(5, 10, 175, 5),
                child: Text(
                    "Desarrollado por:\nUniversidad Privada Del Valle\n\nDesarrolladores:\n\nAxel\nCarolina\nPaulo\nNoemi\nEdward\nMichel"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Card miCard3() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text("       "),
              ),
              FadeInImage(
                alignment: Alignment.centerRight,
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/tramitecochabamba.png'),
                height: 30,
                width: 30,
              ),
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(5, 10, 60, 1),
                child: Text("Trámites Cochabamba\n\n"),
              ),
              RaisedButton(
                  child: Text("Descargar"),
                  onPressed: () {
                    launch(
                        "https://play.google.com/store/apps/details?id=bo.tramitesco.chabamba&hl=es&gl=US");
                  }),
            ],
          )
        ],
      ),
    );
  }

  Card miCardDesign() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text("       "),
              ),
              FadeInImage(
                alignment: Alignment.centerRight,
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/ciudadanoac.png'),
                height: 40,
                width: 40,
              ),
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(5, 10, 60, 5),
                child: Text("Ciudadano Activo\n\n"),
              ),
              RaisedButton(
                  child: Text("Descargar"),
                  onPressed: () {
                    launch(
                        "https://play.google.com/store/apps/details?id=com.gamc.ciudadanoactivo&hl=es_BO&gl=US");
                  }),
            ],
          )
        ],
      ),
    );
  }
}
