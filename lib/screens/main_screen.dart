import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainScreen extends StatelessWidget {

  //final zoomDrawerController;

  //MainScreen(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      //onPressed: () => zoomDrawerController.toggle(),
      onPressed: () => ZoomDrawer.of(context)!.toggle(),
    );

    /*
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Home"),leading: InkWell(
        onTap: () => zoomDrawerController.toggle(), 
        child: Icon(Icons.menu),),),
      body: SafeArea(
        child: Center(child: Text("Home"),),
      ),
    );*/
  }
}