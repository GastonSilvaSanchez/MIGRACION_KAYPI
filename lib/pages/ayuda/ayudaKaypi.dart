
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AyudaKaypi extends StatefulWidget {
  const AyudaKaypi({Key? key}) : super(key: key);

  @override
  _AyudaKaypiState createState() => _AyudaKaypiState();
}

class _AyudaKaypiState extends State<AyudaKaypi> {
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
                  child:orientacion == Orientation.portrait?  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index){
                      return Center(
                        child: ItemCard(color: Colors.primaries[index % Colors.primaries.length])
                      );
                    }
                  ) 
                  : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: 5,
                    itemBuilder: (context, index){
                      return Center(
                        child: ItemCard(color: Colors.primaries[index % Colors.primaries.length])
                      );
                    }, 
                  ),

                ),

              ]
            )
          
          ),
          
        ));
  }
}


//modificar cards
class ItemCard extends StatelessWidget {

  final Color color;

  const ItemCard({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Container(
          height: 170,
          width: double.infinity,
          //modificar colores
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo.shade600,
                color,
              ],
              

            ),

            borderRadius: BorderRadius.circular(25)
          ),

          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Image.asset('assets/img/ruta.jpg', width: 150,),

                SizedBox(height: 20,),

                Text("Rutas de las lineas", style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
