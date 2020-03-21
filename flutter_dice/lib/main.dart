import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("dice"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  print("press left");
                  setState(() {
                    leftDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset("images/dice$leftDiceNumber.png"),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  print("press right");
                  setState(() {
                    rightDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset("images/dice$rightDiceNumber.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
