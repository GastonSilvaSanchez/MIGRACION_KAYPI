import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:puntosestaticos_mapa/helpers/helpers.dart';
import 'package:puntosestaticos_mapa/pages/acceso_gps_page.dart';
import 'package:puntosestaticos_mapa/pages/mapa_page.dart';


//import 'package:puntosestaticos_mapa/pages/mapa_page.dart';


class LoadingPage extends StatefulWidget {

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver{

  @override
  void initState() {
    
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    
    if (  state == AppLifecycleState.resumed ) {
      if ( await Geolocator.isLocationServiceEnabled()  ) {
        Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage() ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: chechGpsYLocactions(context),   
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            return Center( child: Text(snapshot.data));
          }else {
            return Center(child: CircularProgressIndicator.adaptive(strokeWidth: 4));
          }
        },
     ),
   );
  }

  Future chechGpsYLocactions(BuildContext context) async {
    //permisos gps
    final permisoGps = await Permission.location.isGranted;
    //gps activado
    final gpsActivo = await Geolocator.isLocationServiceEnabled();

    if ( permisoGps && gpsActivo ) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage() ));
      return '';
    } else if ( !permisoGps ) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, AccesoGpsPage() ));  
      return 'Es necesario el permiso de GPS';
    } else {
      return 'Active el GPS';
    }
    

    //await Future.delayed(Duration(milliseconds: 1000));
    /*await Future.delayed(Duration(milliseconds: 1000), () {
    Navigator.pushReplacement(
      context,
      navegarMapaFadeIn(context, AccesoGpsPage()),
    );
  });*/
    //Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage()));
    //Navigator.pushReplacementNamed(context, 'mapa');
  }
}