import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/Screens/HomeScreen.dart';
import 'package:youtube/Screens/LibraryScreen.dart';
import 'package:youtube/Screens/SubscribeScreen.dart';
import 'package:youtube/Screens/WhatshotScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _bottomIndex = 0;
  String _searchResult = "";
  
  @override
  Widget build(BuildContext context) {
    
    List<Widget> _menu = [
      HomeScreen(_searchResult),
      WhatshotScreen(),
      SubscribeScreen(),
      LibraryScreen(), 
    ];
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset("images/youtube.png",
          width: 98,
          height: 22),
        actions: <Widget>[
          
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              String query = await showSearch(
                context: context, 
                delegate: CustomSearchDelegate()
              );
              setState(() {
                _searchResult = query;
              });
            },
          ),
          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){},
          ),
          
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          ),
          */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _menu[_bottomIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: _bottomIndex,
        onTap: (index){
          setState(() {
            _bottomIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ]
      ),
    );
  }
}