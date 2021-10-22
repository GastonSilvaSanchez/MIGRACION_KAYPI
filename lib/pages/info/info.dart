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
        backgroundColor: Colors.transparent,
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
      shadowColor: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  color: Colors.lightBlue,
                  child: FadeInImage(
                    alignment: Alignment.center,
                    placeholder: AssetImage('assets/img/loading.gif'),
                    image: AssetImage('assets/img/descargacocha.png'),
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(width: 6.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(" Contribuciones",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Text(" Gobierno Municipal de Cochabamba",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card miCard2() {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  //Devolver a tamaño promedio
                  //Width y Height = 70
                  width: 70.0,
                  height: 70.0,
                  color: Colors.white,
                  child: FadeInImage(
                    alignment: Alignment.center,
                    placeholder: AssetImage('assets/img/loading.gif'),
                    image: AssetImage('assets/img/uni.png'),
                    //y esta parte de Width y Height = 30
                    height: 30,
                    width: 30,
                    //Nota: en caso de modificar tamaños, puedes configurar el tamaño de logos con estos 4 valores, usarlo en caso de modificar diseño
                  ),
                ),
                SizedBox(width: 6.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(" Desarrollado por:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Text(" Universidad Privada Del Valle",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Text(" Desarolladores:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    Text(
                        " \n Axel Eddy Martinez Ayala\n Miguel Angel Terrazas Challapa\n Heidi Ivanna Huanca Chambi\n Luis Angel Jallasa Mamani\n Mirko Marca Moreno\n Christopher Joaquin Jimenez Huamani\n Gabriel Sebastian Clavijo Alessandri\n Sergio Lara Rocabado\n Eric Emmanuel Galleguillos Soudy\n Jimena Gonzales Guarayo\n Axel Matias Miranda Clavel\n Carolina Vivian Escobar Coca\n Paulo David Crespo Orellana\n Noemi Sanchez Aguilar\n Edward Rene Jimenez Veizaga\n Michael Sanabria Suarez",
                        style: TextStyle(color: Colors.black, fontSize: 18.0)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card miCard3() {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  color: Colors.white,
                  child: FadeInImage(
                    alignment: Alignment.center,
                    placeholder: AssetImage('assets/img/loading.gif'),
                    image: AssetImage('assets/img/tramitecochabamba.png'),
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(width: 6.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(" Trámites Cochabamba\n\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ElevatedButton(
                  child: Text("Descargar"),
                  onPressed: () {
                    launch(
                        "https://play.google.com/store/apps/details?id=bo.tramitesco.chabamba&hl=es&gl=US");
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Card miCardDesign() {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  color: Colors.white,
                  child: FadeInImage(
                    alignment: Alignment.center,
                    placeholder: AssetImage('assets/img/loading.gif'),
                    image: AssetImage('assets/img/ciudadanoac.png'),
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(width: 6.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(" Ciudadano Activo\n\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ElevatedButton(
                  child: Text("Descargar"),
                  onPressed: () {
                    launch(
                        "https://play.google.com/store/apps/details?id=com.gamc.ciudadanoactivo&hl=es_BO&gl=US");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
/*
  Card miCardDesign() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  color: Colors.lightBlue,
                  child: FadeInImage(
                    alignment: Alignment.center,
                    placeholder: AssetImage('assets/img/loading.gif'),
                    image: AssetImage('assets/img/uni.png'),
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(width: 6.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text(" Desarrollado por:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Text(" Universidad Privada Del Valle",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.0),
                    Text(" \nAxel Eddy Martinez Ayala\nMiguel Angel Terrazas Challapa\nHeidi Ivanna Huanca Chambi\nLuis Angel Jallasa Mamani\nMirko Marca Moreno\nChristopher Joaquin Jimenez Huamani\nGabriel Sebastian Clavijo Alessandri\nSergio Lara Rocabado\nEric Emmanuel Galleguillos Soudy\nJimena Gonzales Guarayo\nAxel Matias Miranda Clavel\nCarolina Vivian Escobar Coca\nPaulo David Crespo Orellana\nNoemi Sanchez Aguilar\nEdward Rene Jimenez Veizaga\nMichael Sanabria Suarez",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0)),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ElevatedButton(
                  child: Text("Descargar"),
                  onPressed: () {
                    launch(
                        "https://play.google.com/store/apps/details?id=bo.tramitesco.chabamba&hl=es&gl=US");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
*/