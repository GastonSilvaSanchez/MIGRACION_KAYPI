import 'package:flutter/material.dart';

class LinePage extends StatelessWidget {
  const LinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Clase del atributo para search bar
class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //acciones para el app bar
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on th left of the app bar
    return IconButton(
      onPressed: null,
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return "";
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for somethig
    // mostrar la accion del buscador
    final suggestionList = query.isEmpty ? recentLines : Lines;
    return ListView.builder(itemBuilder: (context,index)=>ListTile(
      leading: Icon(Icons.location_city),
      title:Text(suggestionList[]) 
    ));
  }
}
