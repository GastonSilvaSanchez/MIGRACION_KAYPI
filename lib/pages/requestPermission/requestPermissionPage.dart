import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/Routes/routesPage.dart';
import 'package:flutter_kaypi/pages/requestPermission/requestPermissionController.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  const RequestPermissionPage({Key? key}) : super(key: key);

  @override
  _RequestPermissionPageState createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage>
    with WidgetsBindingObserver {
  final _controller =
      RequesrtPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  bool _fromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _subscription = _controller.onStatusChanged.listen(
      (status) {
        switch (status) {
          case PermissionStatus.granted:
            //redirecciona la pagina home en caso de que se concedio el permiso
            _goToHome();
            break;
          case PermissionStatus.permanentlyDenied:
            //abre los ajustes en caso de activacion manual
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("INFO"),
                content: const Text(
                    "No se pudo acceder a la ubicacion del dispositivo"),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      _fromSettings = await openAppSettings();
                    },
                    child: const Text("Ir a ajustes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                ],
              ),
            );
            break;
        }
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && _fromSettings) {
      final status = await _controller.check();
      if (status == PermissionStatus.granted) {
        //en caso de dar permisos manualmente redirige a home
        _goToHome();
      }
    }
    _fromSettings = false;
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _subscription.cancel();
    _controller.dispse();
    super.dispose();
  }

  //redirege a la pagina home
  void _goToHome() {
    Navigator.pushReplacementNamed(context, Routes.RUTA);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.HOME);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.grey,
              Colors.blue,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        //width: double.infinity,
        //height: double.infinity,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: _swiper(),
              ),
              ElevatedButton(
                child: const Text(
                  "Continuar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  _controller.request();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//aca usamos para swiper de las imagenes de ayuda en el splash
  static List<String> imageList = [
    'assets/img/LineasMicros.jpg',
    'assets/img/LineaTaxiTruffi.jpg',
    'assets/img/ruta.jpg',
    'assets/img/worldmap_cbba.png',
    'assets/img/Cochabamba_Cultura.png'
  ];

  static List<String> helps = [
    "Lineas de transporte Cochabamba",
    "Toma un transporte para llegar a tu destino",
    "Observa la ruta de distintas lineas de transporte",
    "Habilita tu ubicacion para mejor servicio",
    "Destinos Turisticos de nuestra amada Llajta"
  ];

  Widget _swiper() {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 500.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 300.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            imageList[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        helps[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
                autoplay: true,
                itemCount: 5,
                viewportFraction: 0.8,
                scale: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
