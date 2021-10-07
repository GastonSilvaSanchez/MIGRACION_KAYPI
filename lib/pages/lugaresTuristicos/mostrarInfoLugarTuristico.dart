import 'package:flutter/material.dart';
/*import 'package:flutter_kaypi/pages/lineasInfo/linea_ruta.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';*/

import 'package:flutter_kaypi/pages/lugaresTuristicos/info_Lugar.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/infoLugarTuristico.dart';

class LineaPages extends StatelessWidget {
  final InforLugarTuristico linea;

  const LineaPages({
    Key? key,
    required this.linea,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey[600],
              size: 28,
            ),
          ),
        ),
        body: _detalleLineaView(context),
      );

  Widget _detalleLineaView(context) => SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              //backgroundImage: AssetImage(linea.imagen),
              backgroundImage: AssetImage('assets/img/KaypiLogo.png'),
              backgroundColor: Colors.transparent,
              radius: 80,
            ),
            const SizedBox(height: 25),
            Text(
              linea.nombre,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'CATEGORIA',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(linea.categoria),
            const SizedBox(height: 25),
            Text(
              'CALLES',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 5),
                physics: BouncingScrollPhysics(),
                itemCount: linea.calles.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        linea.calles[index],
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 25),
            const SizedBox(height: 25),
            Text(
              'IMAGEN',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(linea.imagen),
            const SizedBox(height: 25),
            /*Text(
              'IMAGEN',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 5),
                physics: BouncingScrollPhysics(),
                itemCount: linea.imagen.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        linea.imagen[index].toString(),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 25),*/
            const SizedBox(height: 25),
            Text(
              'DESCRIPCIÓN',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(linea.descripcion),
            const SizedBox(height: 25),
            /*Text(
              'DESCRIPCIÓN',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 5),
                physics: BouncingScrollPhysics(),
                Text(linea.categoria),
                //itemCount: linea.descripcion.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        linea.descripcion[index],
                      ),
                    ),
                  );
                }),*/
            const SizedBox(height: 25),
          ],
        ),
      );
}
