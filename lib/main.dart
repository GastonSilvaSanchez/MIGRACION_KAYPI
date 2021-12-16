import 'package:flutter/material.dart';
//import 'package:flutter_kaypi/pages/Routes/routesPage.dart';
import 'package:flutter_kaypi/zoom_drawer.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaypi',
      theme: ThemeData.light(),
      home: MenuZoom(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/*Para la build de una apk 
flutter build apk --release --no-sound-null-safety
Para la ejecucion del proyecto
flutter run --no-sound-null-safety
*/
