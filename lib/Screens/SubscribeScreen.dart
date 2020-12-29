import 'package:flutter/material.dart';

class SubscribeScreen extends StatefulWidget {
  @override
  _SubscribeScreenState createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Subscribe",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 32  
            )
        )
      )
    );
  }
}