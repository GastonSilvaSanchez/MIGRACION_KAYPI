import 'package:flutter/material.dart';
import 'package:flutter_kaypi/components/my_drawer.dart';
import 'package:flutter_kaypi/provider/lineasInfo_provider.dart';


class FormLineas extends StatefulWidget {
  const FormLineas({Key? key}) : super(key: key);

  @override
  _FormLineasState createState() => _FormLineasState();
}

class _FormLineasState extends State<FormLineas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text('Lineas de Transporte'),
          ),
          body: _lista(),
        );
  }

  Widget _lista() {
    return FutureBuilder(

      future: lineasInfoProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {

        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }
 
        if (!snapshot.hasData) {
          return Center(child: Text('No hay data'));
        }

        return ListView(
          children: _listaItems(snapshot.data, context),
          );
      },

    );
  }

  List<Widget>_listaItems(List<dynamic>? data, BuildContext context) {

    final List<Widget> opciones = [];

    data?.forEach((opt) { 
      final widgetTemp = ListTile(
            title: Text(opt['Nombre'], 
                    style: TextStyle(
                      fontSize: 18.0, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(64, 85, 157, 1.0)
                    ),
                  ),
            subtitle: Text(opt['Categoria']),
            leading: Image.asset("assets/img/KaypiLogo.png"),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 30.0, 
                        color: Color.fromRGBO(64, 85, 157, 1.0),
                      ),
            onTap: () {},
              
            );
            opciones..add(widgetTemp)
                    ..add(Divider());
    });
    return opciones;
  }
}
