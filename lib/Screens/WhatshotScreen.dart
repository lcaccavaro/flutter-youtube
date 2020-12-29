import 'package:flutter/material.dart';

class WhatshotScreen extends StatefulWidget {
  @override
  _WhatshotScreenState createState() => _WhatshotScreenState();
}

class _WhatshotScreenState extends State<WhatshotScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("What's Hot",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 32  
            )
        )
      )
    );
  }
}