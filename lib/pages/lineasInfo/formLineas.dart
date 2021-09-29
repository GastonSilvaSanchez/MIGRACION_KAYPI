import 'package:flutter/material.dart';
import 'package:flutter_kaypi/provider/lineas_api.dart';
import 'package:flutter_kaypi/pages/lineasInfo/linea_page.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FormLineas extends StatefulWidget {
  const FormLineas({Key? key}) : super(key: key);

  @override
  _FormLineasState createState() => _FormLineasState();
}

class _FormLineasState extends State<FormLineas> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => ZoomDrawer.of(context)!.toggle(),
            child: Icon(
              Icons.menu,
              color: Colors.grey[600],
              size: 28,
            ),
          ),
        ),
        body: _lista(context),
      );

  Widget _lista(context) => FutureBuilder<List<Linea>>(
        future: lineasApi.cargarData(),
        initialData: [],
        builder: (context, snapshot) {
          final lineas = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Error'));
              }

              if (!snapshot.hasData) {
                return Center(child: Text('No hay data'));
              }

              return _buildLineas(lineas!, context);
          }
        },
      );

  Widget _buildLineas(List<Linea> lineas, context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: lineas.length,
      itemBuilder: (context, index) {
        final linea = lineas[index];

        return ListTile(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LineaPage(linea: linea),
          )),
          leading: CircleAvatar(
            //backgroundImage: AssetImage(linea.imagen),
            backgroundImage: AssetImage('assets/img/KaypiLogo.png'),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            linea.nombre,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(64, 85, 157, 1.0)),
          ),
          subtitle: Text(linea.categoria),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 30.0,
            color: Color.fromRGBO(64, 85, 157, 1.0),
          ),
        );
      },
    );
  }
}
