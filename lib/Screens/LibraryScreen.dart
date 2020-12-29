import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Library",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 32  
            )
        )
      )
    );
  }
}