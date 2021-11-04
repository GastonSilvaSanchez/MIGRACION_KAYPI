import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lineasInfo/linea_page.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';
import 'package:flutter_kaypi/provider/lineas_api.dart';
import 'package:flutter_kaypi/pages/puntosEstrategicos/formpuntos.dart';

// ignore: must_be_immutable
class LineasPuntos extends StatefulWidget {
  var puntos;
  LineasPuntos({Key? key, required this.puntos}) : super(key: key);

  @override
  _LineasPuntosState createState() => _LineasPuntosState();
}

class _LineasPuntosState extends State<LineasPuntos> {
  @override
  Widget build(BuildContext context) {
    print("lista puntosEstrategicos");
    print(listalineas);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
        title: Text('Lineas'),
      ),
      body: _lista(context),
    );
  }

  Widget _lista(context) => FutureBuilder<List<Linea>>(
        future: lineasApi.cargarData(),
        initialData: [],
        builder: (context, snapshot) {
          final lineas = snapshot.data!
              .where((f) => widget.puntos.lineas.contains(f.nombre))
              .toList();

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Error'));
              }

              if (!snapshot.hasData ||
                  lineas.isEmpty ||
                  snapshot.data!.isEmpty) {
                return Center(child: Text('No hay data'));
              }

              return _buildLineas(lineas, context);
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
                color: Colors.blue.shade900),
          ),
          subtitle: Text(linea.categoria),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 30.0,
            color: Colors.blue.shade900,
          ),
        );
      },
    );
  }
}
