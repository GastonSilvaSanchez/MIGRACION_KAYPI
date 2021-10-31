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
  bool _isMinBusVisible = true;
  bool _isTaxTruVisible = true;
  bool _isMicroVisible = true;
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

  //Widget de visualizacion de rutas en lista
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
              List<Linea> lineasMiniBus = getLinesFromCat("Minibus", lineas!);
              List<Linea> lineasTaxTruf = getLinesFromCat("TaxiTrufi", lineas);
              List<Linea> lineasMicro = getLinesFromCat("Micro", lineas);
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListTile(),
                    ListTile(
                      onTap: () =>
                          setState(() => _isMinBusVisible = !_isMinBusVisible),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/img/KaypiLogo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Minibus",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isMinBusVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _buildLineas(lineasMiniBus, context, _isMinBusVisible),
                    ListTile(
                      onTap: () =>
                          setState(() => _isTaxTruVisible = !_isTaxTruVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/img/LineaTaxiTruffi.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Taxitrufi",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isTaxTruVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _buildLineas(lineasTaxTruf, context, _isTaxTruVisible),
                    ListTile(
                      onTap: () =>
                          setState(() => _isMicroVisible = !_isMicroVisible),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/img/LineasMicros.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        "Micro",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(64, 85, 157, 1.0)),
                      ),
                      trailing: _isMicroVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(64, 85, 157, 1.0),
                            ),
                    ),
                    _buildLineas(lineasMicro, context, _isMicroVisible)
                  ],
                ),
              );
          }
        },
      );
  getLinesFromCat(String cat, List<Linea> lineas) {
    List<Linea> res = [];
    Linea linea;
    for (int i = 0; i < lineas.length; i++) {
      linea = lineas[i];
      if (linea.categoria == cat) {
        res.add(linea);
      }
    }
    return res;
  }

  //widget de lista de lineas
  Widget _buildLineas(List<Linea> lineas, context, _isVisible) {
    return Visibility(
        visible: _isVisible,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: lineas.length,
          itemBuilder: (context, index) {
            final linea = lineas[index];
            //widget con informacion de lineas individuales
            return ListTile(
              tileColor: Color.fromRGBO(10, 25, 10, 0.035),
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
        ));
  }
}
