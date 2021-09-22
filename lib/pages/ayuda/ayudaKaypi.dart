import 'package:flutter/material.dart';
import 'package:flutter_kaypi/pages/ayuda/CardInfo.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';



class AyudaKaypi extends StatefulWidget {
  const AyudaKaypi({Key? key}) : super(key: key);

  @override
  _AyudaKaypiState createState() => _AyudaKaypiState();
}


//clase donde va contener sus atributos de cada card
//puedes aumentar mas atributos
class CardItem {
  late String titulo;
  late String info;
  late String imagen;

  CardItem(String titulo, String info, String imagen)
  {
    this.titulo = titulo;
    this.info = info;
    this.imagen = imagen;
  }
  
}

class _AyudaKaypiState extends State<AyudaKaypi> {

  //lista de la clase card item
  List<CardItem> elementos = new List.empty(growable: true);

  //editar informacion de cada card
  _AyudaKaypiState()
  {
    elementos.add(new CardItem("Rutas", "Informacion", "assets/img/ruta.jpg"));
    elementos.add(new CardItem("Rutas", "Informacion", "assets/img/ruta.jpg"));
    elementos.add(new CardItem("Rutas", "Informacion", "assets/img/ruta.jpg"));
    elementos.add(new CardItem("Rutas", "Informacion", "assets/img/ruta.jpg"));
    elementos.add(new CardItem("Rutas", "Informacion", "assets/img/ruta.jpg"));
  }

  //editar card
  Widget ListaOpciones(BuildContext context, int index){
    return GestureDetector(
      onTap: (){
        //enlazar o abrir vista
        Navigator.push(context, MaterialPageRoute(builder: (context) => CardInfo(elementos[index])));
      },
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(10),

      child: Container(
        height: 150,
        width: double.infinity,

        //color del card
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo.shade600,
                Colors.primaries[index % Colors.primaries.length],
              ],
              

            ),

            borderRadius: BorderRadius.circular(25)
            
        ),

        //editar
        child: Row(
          
          //tiutlo e imagen
          children: <Widget> [
            Hero(tag: elementos[index], child: Image.asset(elementos[index].imagen, height: 150,),),
            SizedBox(width: 20,),
            Text(elementos[index].titulo),


          ],
        )
      ),
    ));
  }


  @override
  Widget build(BuildContext context) {

    final orientacion = MediaQuery.of(context).orientation;
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.indigo.shade900,
          //drawer: MyDrawer(),
          extendBodyBehindAppBar: true,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: Icon(Icons.menu, color: Colors.grey[600], size: 28,),),),


          body: Padding(
            padding: const EdgeInsets.all(0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[ 
                Expanded(

                  //animacion
                  child: AnimatedSwitcher(
                  //transicion
                  duration: const Duration(seconds: 2),

                  //estilo de transicion
                  
                  transitionBuilder: (widget, animation){
                    return ScaleTransition(
                      scale: animation,
                      child: widget,
                    );

                  },
                  

                  child: orientacion == Orientation.portrait?  ListView.builder(

                    //cantidad de cards
                    itemCount: elementos.length,

                    //generar lista de cards
                    itemBuilder: (context, index) =>  ListaOpciones(context, index)

                  )

                  : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    //cantidad de cards
                    itemCount: elementos.length,
                    //generar lista de cards
                    itemBuilder: (context, index) =>  ListaOpciones(context, index),
                   
                  ),

                ),),

              ]
            )
          
          ),
          
        ));
  }
}

