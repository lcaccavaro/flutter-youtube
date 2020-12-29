import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, "");
        },
        );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    close(context, query);
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> list = List();

    if(query.isNotEmpty){
      list = [
        "Flutter",
        "iOS",
        "Android"
      ].where(
        (text)=> text.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, list[index]);
            },
            title: Text(list[index]),
          );
        },
      );
    }
    else{
      return Center(
                child: Text("Nenhum resultado foi encontrado"),
              );
    }
    
  }

}