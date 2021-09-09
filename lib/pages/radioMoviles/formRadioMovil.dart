import 'package:flutter/material.dart';
import 'package:flutter_kaypi/components/my_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class FormRadioMovil extends StatefulWidget {
  const FormRadioMovil({Key? key}) : super(key: key);

  @override
  _FormRadioMovilState createState() => _FormRadioMovilState();
}

class _FormRadioMovilState extends State<FormRadioMovil> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Radio móviles"),
      ),
        body:Card(
          child:Container(
            height: 100,
            color: Colors.white,
            child: Row(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Expanded(
                      child:Image.asset("assets/img/KaypiLogo.png"),
                      flex:2 ,
                    ),
                  ),
                ),
                Expanded(
                  child:Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListTile(
                            title: Text("Temporal"),
                            subtitle: Text("Consultas y/o Reclamos:"),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: Row(
                                  children:<Widget>[
                                  Text("4576296"),
                                  Icon(Icons.call)                                  
                                ],),
                                //child: Icon(Icons.call),
                                //child: Text("4576296"),
                                
                                onPressed: () => launch('tel://4576296'),
                              ),
                              /*SizedBox(width: 8,),
                              TextButton(
                                child: Text("4546464"),
                                onPressed: (){},
                              ),
                              SizedBox(width: 8,)*/
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex:8 ,
                ),
              ],
            ),
          ),
          elevation: 8,
          margin: EdgeInsets.all(10),
        ),
    );
  }
}