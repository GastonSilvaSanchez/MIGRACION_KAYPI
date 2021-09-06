import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/Routes/pages.dart';
import 'package:flutter_kaypi/pages/Routes/routesPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaypi',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: Routes.HOME,
      routes: appRoutes(),
    );
  }
}
