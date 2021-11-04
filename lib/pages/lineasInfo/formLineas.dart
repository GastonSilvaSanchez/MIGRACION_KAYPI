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
   void initState() {
    lineasApi.cargarData().then((data) {
      setState(() {
        lines = filteredLines = data;
      });
    });
    super.initState();
  }
     void _filterLines(value) {
    setState(() {
      filteredLines = lines
          .where((line) =>
              line.nombre.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  List lines = [];
  List filteredLines = [];
  bool isSearching = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title:  !isSearching
            ? Text('Lineas de Transporte', style:TextStyle(color: Colors.blue.shade900))
            
            : TextField(
                onChanged: (value) {
                  _filterLines(value);
                },
                style: TextStyle(color:  Colors.blue.shade900,),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color:Colors.blue.shade900,
                    ),
                    hintText: "Busca tu linea de transporte",
                    hintStyle: TextStyle(color: Colors.blue.shade900),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                ),
              ), 
      actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  color: Colors.blue.shade900,
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredLines = lines;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.blue.shade900,
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],      
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () => ZoomDrawer.of(context)!.toggle(),
            child: Icon(
              Icons.menu,
              color: Colors.blue.shade900,
              size: 28,
            ),
          ),
        ),
        body:  !isSearching
        ? Column(
           children: <Widget>[
            SizedBox(height: 15),
            _lista(context),
           ],
          )
        : Container(
        padding: EdgeInsets.all(10),
        child: filteredLines.length > 0
            ? ListView.builder(
                itemCount: filteredLines.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LineaPage(linea:  filteredLines[index]),
                    )),
                      
                     /* Navigator.of(context).pushNamed(Country.routeName,
                          arguments: filteredPoints[index]);*/
                    
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Text(
                          filteredLines[index].nombre,
                          style: TextStyle(fontSize: 18,color: Colors.blue.shade900),
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),

      ) 
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
                            color: Colors.blue.shade900
                        ),
                      ),
                      trailing: _isMinBusVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Colors.blue.shade900,
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color:Colors.blue.shade900,
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
                            color: Colors.blue.shade900),
                      ),
                      trailing: _isTaxTruVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Colors.blue.shade900,
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Colors.blue.shade900,
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
                            color: Colors.blue.shade900),
                      ),
                      trailing: _isMicroVisible == true
                          ? Icon(
                              Icons.arrow_upward_rounded,
                              size: 30.0,
                              color: Colors.blue.shade900,
                            )
                          : Icon(
                              Icons.arrow_downward_rounded,
                              size: 30.0,
                              color: Colors.blue.shade900,
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
              tileColor: Colors.white,
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
        ));
  }
}
