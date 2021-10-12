import 'package:flutter/material.dart';
import 'package:flutter_kaypi/routes/routes_page.dart';
import 'package:flutter_kaypi/routes/pages.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeNotifier = Provider.of<ThemeNotifier>(context);
    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      routes: appRoutes(),
    );
  }
}
