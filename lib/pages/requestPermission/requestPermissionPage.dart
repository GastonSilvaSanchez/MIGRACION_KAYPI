import 'dart:async';

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
    Navigator.pushReplacementNamed(context, Routes.PRUEBA);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: ElevatedButton(
            child: const Text("Continuar"),
            onPressed: () {
              _controller.request();
            },
          ),
        ),
      ),
    );
  }
}
