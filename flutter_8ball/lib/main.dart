import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BallPage(),
    );
  }
}

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask"),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: FlatButton(
            child: Image.asset("images/ball$ballNumber.png"),
            onPressed: () {
              print("I got clicked");
              setState(() {
                ballNumber = Random().nextInt(5) + 1;
              });
            },
          ),
        ),
      ),
    );
  }
}
