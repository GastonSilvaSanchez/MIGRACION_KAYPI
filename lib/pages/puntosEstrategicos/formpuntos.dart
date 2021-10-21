import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/model/puntoEstrategico.dart';
import 'package:flutter_kaypi/provider/puntosEstrategicos_api.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FormPuntos extends StatefulWidget {
  const FormPuntos({Key? key}) : super(key: key);

  @override
  _FormPuntosState createState() => _FormPuntosState();
}

class _FormPuntosState extends State<FormPuntos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.indigo.shade600,
        appBar: AppBar(
          title: Text('Puntos Estrategicos'),
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
        body: _lista(context),
    );
  }

  Widget _lista(context) => FutureBuilder<List<PuntoEstrategico>>(
        future: puntoEstrategicoApi.cargarData(),
        initialData: [],
        builder: (context, snapshot) {
          final lineas = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Error'));
              }

              if (!snapshot.hasData) {
                return Center(child: Text('No hay data'));
              }

              return _buildLineas(lineas!, context);
          }
        },
      );

  Widget _buildLineas(List<PuntoEstrategico> puntosEstrategicos, context) {

      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: puntosEstrategicos.length,
        itemBuilder: (context,  index) {
                  
        final puntos = puntosEstrategicos[index];
                  
          return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    margin: EdgeInsets.all(15),
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
                        child: ClipRRect(
                          // Los bordes del contenido del card se cortan usando BorderRadius

                          // widget hijo que será recortado segun la propiedad anterior
                          child: Column(
                            children: <Widget>[
                              // widget Image para mostrar una imagen
                              SizedBox(
                                height: 10,
                              ),
                              /*Image(
                                // Como queremos traer una imagen desde un url usamos NetworkImage
                                image: AssetImage(puntos.imagen),
                              ),*/

                              // Usamos Container para el contenedor de la descripción
                              Container(
                                padding: EdgeInsets.all(1),
                                child: Text(puntos.nombre,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      puntos.descripcion,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.blue,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () => {},
                                      child: Text('Puntos')),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.blue,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () => {},
                                      child: Text('Lineas'))
                                ],
                              )
                            ],
                          ),
                        )),
                    // Dentro de esta propiedad usamos ClipRRect
                  );
        }
      );
  }
}
