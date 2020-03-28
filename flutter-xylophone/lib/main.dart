import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Scaffold(
//            appBar: AppBar(
//              title: Text("xylophone"),
//            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                XylophoneButton(
                  soundNumber: 1,
                  color: Colors.red,
                ),
                XylophoneButton(
                  soundNumber: 2,
                  color: Colors.orange,
                ),
                XylophoneButton(
                  soundNumber: 3,
                  color: Colors.yellow,
                ),
                XylophoneButton(
                  soundNumber: 4,
                  color: Colors.green,
                ),
                XylophoneButton(
                  soundNumber: 5,
                  color: Colors.blue.shade900,
                ),
                XylophoneButton(
                  soundNumber: 6,
                  color: Colors.blue,
                ),
                XylophoneButton(
                  soundNumber: 7,
                  color: Colors.purple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class XylophoneButton extends StatelessWidget {
  final int soundNumber;
  final Color color;

  XylophoneButton({this.soundNumber, this.color});

  void playSound({int soundNumber, String text}) {
    var player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber: soundNumber);
        },
      ),
    );
  }
}
