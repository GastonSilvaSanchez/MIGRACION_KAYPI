import 'dart:ffi';

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
                    hintStyle: TextStyle(color: Colors.blue.shade900,decoration: TextDecoration.none),
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
        ?  _lista(context)
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

  List<String> items=[];
  List<String> listaCat =[];
  List<Linea> listaInicial = [];
  List<Linea> listaFinal = [];
   String dropdownvalue="Todo";
  
  //Widget de visualizacion de rutas en lista
  Widget _lista(context) => FutureBuilder<List<Linea>>(
        future: lineasApi.cargarData(),
        initialData: [],
        builder: (context, snapshot) {
          final lineas = snapshot.data;   
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: 
              return Center(child: CircularProgressIndicator(color: Colors.blue.shade900,));
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Error'));
              }

              if (!snapshot.hasData) {
                return Center(child: Text('No hay data'));
              }            
               listaCat=getCategories(lineas!);
               items=listaCat;
               listaFinal= getLinesFromCat(dropdownvalue.toString(), lineas); 
              return ListView(  
                children: [
                    ListTile(
              tileColor: Colors.white,
              title: Text(
                "Categorias",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900),
              ),
              
              trailing:DropdownButton(
                value: dropdownvalue,
                iconSize: 35,
                underline: Container(color:Colors.blue.shade900, height:1.5),
                style: const TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 18.0,),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.blue.shade900,),
                  items:items.map((String items) {
                       return DropdownMenuItem(
                           value: items,
                           child: Text(items)
                           
                       );
                  }
                  
                  ).toList(),
                onChanged: (String? newValue) {
                 setState(() {
                 dropdownvalue = newValue!;
                 listaFinal= getLinesFromCat(dropdownvalue.toString(), lineas);
                 });
                },
              ),
           ),
            Divider(
                height: 5.0,
                color: Colors.blue.shade900,
           ),
           _buildLineas(listaFinal, context, _isMinBusVisible),
            ]);             
          }
        },
      );
      
  getLinesFromCat(String cat, List<Linea> lineas) {
    List<Linea> res = [];
    Linea linea;
    if(cat=="Todo"){
      res=lineas;
    }
    else{
      for (int i = 0; i < lineas.length; i++) {
        linea = lineas[i];
        if (linea.categoria == cat) {
          res.add(linea);
        }
      }
    }
   
    return res;
  }
  getCategories(List<Linea> lineas) {
    List<String> res = [];
    Linea linea;
    var lineaAUX; 
    res.add("Todo");
    var aux = 0;
    res.add(lineas[0].categoria);
    for (int i = 0; i < lineas.length; i++) { 
          linea = lineas[i]; 
          res.add(linea.categoria);
    } 
    lineaAUX =  res.toSet().toList();
    return lineaAUX;
  }
  //widget de lista de lineas
  Widget _buildLineas(List<Linea> lineas, context, _isVisible) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
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
        );
  }
}
