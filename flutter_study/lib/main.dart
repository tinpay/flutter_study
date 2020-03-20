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
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("lib/images/4022779.rsz.png"),),
                  Text("tinpay", style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "NotoSerifJP",
                      color: Colors.black54),),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Profile(),
                        Profile(),
                        Profile(),
                      ],
                    ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Row(
          children: <Widget>[
            Icon(Icons.email, size: 20.0,),
            SizedBox(width: 10.0,),
            Text("tinpay@tinpay.xxx")
          ]),
    );
  }
}

