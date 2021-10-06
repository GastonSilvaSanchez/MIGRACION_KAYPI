import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_kaypi/pages/lugaresTuristicos/lugar.dart';

Widget ListaOpciones(BuildContext context, int index, List<Lugar> elementos) {
  buildExpanded1() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            elementos[index].descripcion,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 40.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        side: BorderSide(color: Colors.indigo)),
                    onPressed: () {},
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10, bottom: 10),
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child:
                        Text("Ver ubicación", style: TextStyle(fontSize: 15)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 40.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        side: BorderSide(color: Colors.indigo)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10, bottom: 10),
                    color: Colors.white,
                    textColor: Colors.indigo,
                    child:
                        Text("Más información", style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          )
        ]);
  }

  return ExpandableNotifier(
      child: Padding(
    padding: const EdgeInsets.all(5),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          SizedBox(
              child: Image.asset(
            elementos[index].imagen,
            fit: BoxFit.cover,
          )),
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    elementos[index].nombre,
                    style: Theme.of(context).textTheme.headline6,
                  )),
              collapsed: Container(),
              expanded: buildExpanded1(),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  ));
}

///INFO LUGARES TURÍSTICOS
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        elevation: 0,
        title: new Text('Información',
            style: new TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      //body: Center(),
      body: Container(
        child: Column(
          children: <Widget>[miCard()],
        ),
      ),
    );
  }
}

Card miCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(10),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text("  "),
            ),
            SizedBox(
              height: 400,
              width: 60,
            ),
            /*FadeInImage(
              alignment: Alignment.centerLeft,
              placeholder: AssetImage('assets/img/loading.gif'),
              image: AssetImage('assets/img/descargacocha.png'),
              height: 40,
              width: 40,
            ),*/
            Container(
              margin: EdgeInsets.all(0),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(5, 10, 200, 5),
              child: Text(
                  "Nombre:\n\nCategoría:\n\nCalles:\n\nImagen:\n\nDescripción:\n\n"),
            ),
          ],
        )
      ],
    ),
  );
}
