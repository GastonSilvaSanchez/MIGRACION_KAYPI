import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AyudaKaypi extends StatefulWidget {
  const AyudaKaypi({Key? key}) : super(key: key);

  @override
  _AyudaKaypiState createState() => _AyudaKaypiState();
}

class _AyudaKaypiState extends State<AyudaKaypi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.indigo.shade900,
          //drawer: MyDrawer(),
          extendBodyBehindAppBar: true,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(Icons.menu, color: Colors.grey[600], size: 28,),),),

          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Center(

                    child: Wrap(

                      spacing: 5,
                      runSpacing: 5,
                      children: <Widget>[
                        
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Card(
                            color: Colors.indigoAccent.shade400,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/img/ruta.jpg', width: 150,),

                                  SizedBox(height: 20,),

                                  Text("Rutas de las lineas", style: TextStyle(color: Colors.white, fontSize: 18.0),),

                                  SizedBox(height: 10,),

                                  Text("Busca la ruta favorita", style: TextStyle(color: Colors.white, fontSize: 18.0),),

                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Card(
                            color: Colors.indigoAccent.shade400,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/img/LineasMicros.jpg', width: 180,),

                                  SizedBox(height: 20,),

                                  Text("Rutas de las lineas", style: TextStyle(color: Colors.white, fontSize: 18.0),),

                                  SizedBox(height: 10,),

                                  Text("Busca la ruta favorita", style: TextStyle(color: Colors.white, fontSize: 18.0),),

                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Card(
                            color: Colors.indigoAccent.shade400,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/img/ruta.jpg', width: 150,),

                                  SizedBox(height: 20,),

                                  Text("Rutas de las lineas", style: TextStyle(color: Colors.white, fontSize: 18.0),),

                                  SizedBox(height: 10,),

                                  Text("Busca la ruta favorita", style: TextStyle(color: Colors.white, fontSize: 18.0),),

                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Card(
                            color: Colors.indigoAccent.shade400,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/img/LineasMicros.jpg', width: 180,),

                                  SizedBox(height: 20,),

                                  Text("Rutas de las lineas", style: TextStyle(color: Colors.white, fontSize: 18.0),),

                                  SizedBox(height: 10,),

                                  Text("Busca la ruta favorita", style: TextStyle(color: Colors.white, fontSize: 18.0),),

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                  
                    ),
                  ),

                )
              ],

            ),
            
          ),
        ));
  }
}
