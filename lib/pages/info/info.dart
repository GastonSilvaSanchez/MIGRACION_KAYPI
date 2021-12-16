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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blue.shade900,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            /*leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 28,
          ),
        ),*/
            leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),

          ///instanciacion y configuraion del cuerpo de la ventana
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  ///instanciacion de elementos de la lista
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(0),

                          ///divicion en columnas
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

                              ///asignacion de tamaño
                              SizedBox(height: 10.0),

                              ///salto de linea
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '\n',
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              /// version de aplicacion y configuracion de visualizacion
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Versión 2.0',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              /// llamado a las card para su implementacion
                              miCard(),
                              miCard2(),

                              Divider(
                                height: 90.0,
                                color: Colors.white,
                              ),

                              ///divicion de partes dentro de la ventana
                              /// inicio de otras aplicaciones
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Otras Aplicaciones',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),

                              SizedBox(height: 30.0),

                              /// llamado a los card para su implementacion
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
                placeholder: AssetImage('assets/img/loading.gif'),
                image: AssetImage('assets/img/descargacocha.png'),
                height: 60,
                width: 60,
              ),
              Container(
                margin: EdgeInsets.all(0),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 20, 50, 20),
                child:
                    Text("Contribuciones\n\nGobierno Municipal de Cochabamba"),
              ),
            ],
          )
        ],
      ),
    );
  }

  ///instanciacion de la clase micard2
  Card miCard2() {
    return Card(
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
                padding: EdgeInsets.fromLTRB(20, 30, 100, 30),
                child: Text(
                    "Desarrollado por:\nUniversidad Privada Del Valle\n\nDesarrolladores:\n\nGabriel Sebastian Clavijo\nLuis Ángel Jallasa\nMirko Marca\nMiguel Angel Terrazas\nHeidi Ivanna Huanca\nAxel Eddy Martinez\nCristopher Joaquin Jimenez\nEric Emmanuel Galleguillos\nSergio Lara Rocabado\nJimena Gonzales\nAxel Matias Miranda\nCarolina Vivian Escobar\nPaulo David Crespo\nNoemi Sanchez\nEdward Rene Jimenez\nMichel Sanabria"),
              ),
            ],
          )
        ],
      ),
    );
  }

  ///instanciacion de la clase micard3
  Card miCard3() {
    return Card(
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
                child: MaterialButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.download,
                      size: 24,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                    onPressed: () {
                      launch(
                          "https://play.google.com/store/apps/details?id=bo.tramitesco.chabamba&hl=es&gl=US");
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  ///instanciacion de la clase micardDesign
  Card miCardDesign() {
    return Card(
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
                child: MaterialButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.download,
                      size: 24,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                    onPressed: () {
                      launch(
                          "https://play.google.com/store/apps/details?id=com.gamc.ciudadanoactivo&hl=es_BO&gl=US");
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
