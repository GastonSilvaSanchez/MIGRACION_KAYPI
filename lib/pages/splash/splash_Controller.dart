import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:flutter_kaypi/pages/Routes/routesPage.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends ChangeNotifier {
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission);

  Future<void> checkPermission() async {
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted ? Routes.RUTA : Routes.PERMISSIONS;
    notifyListeners();
  }
}
