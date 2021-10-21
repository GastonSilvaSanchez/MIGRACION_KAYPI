import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoApp extends StatefulWidget {
  const InfoApp({Key? key}) : super(key: key);

  @override
  _InfoAppState createState() => _InfoAppState();
}

class _InfoAppState extends State<InfoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.indigo.shade600,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade600,
        elevation: 0,
        leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(
            Icons.menu,
            color: Colors.grey[600],
            size: 28,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/img/kaypi.png',
                              width: 170,
                            ),
                          ),
                          /*Container(
                                margin: EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text('Kaypi',
                                  style: TextStyle(
                                  color: Colors.blue[700],
                                  letterSpacing: 2.0,
                    
                                    fontFamily: 'AlfaSlabOne',
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),*/

                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/img/uni.png',
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
                          SizedBox(
                            height: 20,
                          ),
                          miCard(),
                          miCard2(),
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
                          miCard3(),
                          miCardDesign(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }

  Card miCard() {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Container(
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
            borderRadius: BorderRadius.circular(25)),
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
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: AssetImage('assets/img/descargacocha.png'),
                  height: 40,
                  width: 40,
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(5, 10, 60, 5),
                  child: Text(
                      "Contribuciones\n\nGobierno Municipal de Cochabamba"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Card miCard2() {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Container(
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
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("       "),
                ),
                FadeInImage(
                  alignment: Alignment.centerRight,
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: AssetImage('assets/img/uni.png'),
                  height: 40,
                  width: 40,
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(5, 10, 100, 5),
                  child: Text(
                      "Desarrollado por:\nUniversidad Privada Del Valle\n\nDesarrolladores:\n\nAxel\nCarolina\nPaulo\nNoemi\nEdward\nMichel"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Card miCard3() {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Container(
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
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInImage(
                  alignment: Alignment.centerRight,
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: AssetImage('assets/img/tramitecochabamba.png'),
                  height: 40,
                  width: 40,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                  child: Text("Trámites Cochabamba\n\n"),
                ),
                Center(
                  child: ElevatedButton(
                      child: Text("Descargar"),
                      onPressed: () {
                        launch(
                            "https://play.google.com/store/apps/details?id=bo.tramitesco.chabamba&hl=es&gl=US");
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Card miCardDesign() {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Container(
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
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInImage(
                  alignment: Alignment.centerRight,
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: AssetImage('assets/img/ciudadanoac.png'),
                  height: 40,
                  width: 40,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(5, 10, 35, 0),
                  child: Text("Ciudadano Activo\n\n"),
                ),
                Center(
                  child: ElevatedButton(
                      child: Text("Descargar"),
                      onPressed: () {
                        launch(
                            "https://play.google.com/store/apps/details?id=com.gamc.ciudadanoactivo&hl=es_BO&gl=US");
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
