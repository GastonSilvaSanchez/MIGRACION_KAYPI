import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as Thendelo;
import 'package:permission_handler/permission_handler.dart';

class GpsLocation extends StatefulWidget {
  @override
  _GpsLocationState createState() => _GpsLocationState();
}

class _GpsLocationState extends State<GpsLocation> {
  //flutter
/*
  Future<void> getpermission() async {
    PermissionStatus _permission = await Permission.location.status;
    if (_permission != PermissionStatus.granted) {}

    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if (permission == PermissionStatus.denied) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator = new Geolocator();
    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        showToast('denied');
        break;
      case GeolocationStatus.disabled:
        showToast('disabled');
        break;
      case GeolocationStatus.restricted:
        showToast('restricted');
        break;
      case GeolocationStatus.unknown:
        showToast('unknown');
        break;
      case GeolocationStatus.granted:
        showToast('Access granted');
        _getCurrentLocation();
    }
  }

  void showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecFor Ios: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
