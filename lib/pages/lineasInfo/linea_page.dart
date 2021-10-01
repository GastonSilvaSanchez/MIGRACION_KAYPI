import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/lineasInfo/linea_ruta.dart';
import 'package:flutter_kaypi/pages/model/linea.dart';

class LineaPage extends StatelessWidget {
  final Linea linea;
  const LineaPage({
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
            ElevatedButton(
              child: Text(
                'RUTAS',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              //Aca incorporar para vizualizar rutas de la lina.
              onPressed: () {
                /*print(0);
                print("------");
                  List<double> listLat = <double>[];
                  List<double> listLng = <double>[];
                  int cont=0;
                  for (var e in linea.ruta[0].puntos) { 
                  print('${e.lat}'+'${e.lng}');
                  listLat.add(e.lat);
                  listLng.add(e.lng);
                  cont++;
                  }
                print("------");
                print(cont);*/
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LineaRuta(),
                    settings: RouteSettings(
                      arguments: linea 
                    ),
                  ),
                );
                
              },
            ),
            const SizedBox(height: 25),
            Text(
              'PASAJES',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 5),
                physics: BouncingScrollPhysics(),
                itemCount: linea.pasajes.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        linea.pasajes[index],
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 25),
            Text(
              'HORARIOS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 5),
                physics: BouncingScrollPhysics(),
                itemCount: linea.horarios.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        linea.horarios[index],
                      ),
                    ),
                  );
                }),
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
              },
            ),
            const SizedBox(height: 25),
            Text(
              'TELEFONOS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 5),
                physics: BouncingScrollPhysics(),
                itemCount: linea.telefonos.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        linea.telefonos[index].toString(),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 25),
            Text(
              'ZONA',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 5),
                physics: BouncingScrollPhysics(),
                itemCount: linea.zonasCBBA.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        linea.zonasCBBA[index],
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 25),
          ],
        ),
      );
}
