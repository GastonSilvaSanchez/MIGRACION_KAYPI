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
<<<<<<< HEAD
      backgroundColor: Colors.indigo[800],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
=======
      backgroundColor: Colors.indigo.shade600,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade600,
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
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
<<<<<<< HEAD

      ///instanciacion y configuraion del cuerpo de la ventana
=======
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
<<<<<<< HEAD
              ///instanciacion de elementos de la lista
=======
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(0),
<<<<<<< HEAD

                      ///divicion en columnas
=======
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
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
                          ///divicion de partes dentro de la ventana
                          ///
                          ///intanciacion de una imagen (logotipo)
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/img/uni.png',
                              width: 150,
                              height: 150,
                            ),
                          ),

<<<<<<< HEAD
                          ///asignacion de tamaño
                          SizedBox(height: 10.0),

                          ///salto de linea
=======
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/img/uni.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                          SizedBox(height: 10.0),
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '\n',
                              textAlign: TextAlign.center,
                            ),
                          ),
<<<<<<< HEAD

                          /// version de aplicacion y configuracion de visualizacion
=======
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
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
<<<<<<< HEAD

                          SizedBox(
                            height: 20,
                          ),

                          /// llamado a las card para su implementacion
                          miCard(),
                          miCard2(),

=======
                          SizedBox(
                            height: 20,
                          ),
                          miCard(),
                          miCard2(),
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
                          Divider(
                            height: 90.0,
                            color: Colors.grey[600],
                          ),
<<<<<<< HEAD

                          ///divicion de partes dentro de la ventana
                          /// inicio de otras aplicaciones
=======
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
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
<<<<<<< HEAD

                          SizedBox(height: 30.0),

                          /// llamado a los card para su implementacion
=======
                          SizedBox(height: 30.0),
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
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

  ///instanciacion de la clase micard
  Card miCard() {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.all(10),
      elevation: 10,
<<<<<<< HEAD
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
                child:
                    Text("Contribuciones\n\nGobierno Municipal de Cochabamba"),
              ),
            ],
          )
        ],
=======
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
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
      ),
    );
  }

  ///instanciacion de la clase micard2
  Card miCard2() {
    return Card(
<<<<<<< HEAD
      ///configuracion de visualizacion
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        ///division en columnas
        ///instanciacion del widget
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text("       "),
              ),

              ///insercion de imagen
              FadeInImage(
                alignment: Alignment.centerRight,
                placeholder: AssetImage('assets/img/loading.gif'),
                image: AssetImage('assets/img/uni.png'),
                height: 40,
                width: 40,
              ),

              /// contenerdor donde se muestra la informacion de los desarrolladores
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
=======
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
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
      ),
    );
  }

  ///instanciacion de la clase micard3
  Card miCard3() {
    return Card(
<<<<<<< HEAD
      ///configuracion de visualizacion
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        ///division en columnas
        ///instanciacion del widget
        children: <Widget>[
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text("       "),
              ),

              ///insercion de imagen
              FadeInImage(
                alignment: Alignment.centerRight,
                placeholder: AssetImage('assets/img/loading.gif'),
                image: AssetImage('assets/img/tramitecochabamba.png'),
                height: 30,
                width: 30,
              ),

              /// contenerdor donde se muestra tramites cbba
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(5, 10, 40, 0),
                child: Text("Trámites Cochabamba\n\n"),
              ),

              /// enlace para redirigir a la descarga de la aplicacion el googleplaystore
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
=======
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
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
      ),
    );
  }

  ///instanciacion de la clase micardDesign
  Card miCardDesign() {
    return Card(
<<<<<<< HEAD
      ///configuracion de visualizacion
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        ///division en columnas
        ///instanciacion del widget
        children: <Widget>[
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text("       "),
              ),

              ///insercion de imagen
              FadeInImage(
                alignment: Alignment.centerRight,
                placeholder: AssetImage('assets/img/loading.gif'),
                image: AssetImage('assets/img/ciudadanoac.png'),
                height: 40,
                width: 40,
              ),

              /// contenerdor donde se muestra cuidadano
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(5, 10, 60, 0),
                child: Text("Ciudadano Activo\n\n"),
              ),

              /// enlace para redirigir a la descarga de la aplicacion el googleplaystore
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
=======
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
>>>>>>> 2227f645edd97def8cd21c5e0718783642472853
      ),
    );
  }
}
