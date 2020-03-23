import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  void playSound({int soundNumber, String text}) {
    var player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("xylophone"),
            ),
            body: Column(
              children: <Widget>[
                FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    playSound(soundNumber: 1, text: "test");
                  },
                ),
                FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    playSound(text: "test", soundNumber: 2);
                  },
                ),
                FlatButton(
                  color: Colors.yellow,
                  onPressed: () {
                    playSound(soundNumber: 3);
                  },
                ),
                FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    playSound(soundNumber: 4);
                  },
                ),
                FlatButton(
                  color: Colors.blue.shade900,
                  onPressed: () {
                    playSound(soundNumber: 5);
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    playSound(soundNumber: 6);
                  },
                ),
                FlatButton(
                  color: Colors.purple,
                  onPressed: () {
                    playSound(soundNumber: 7);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
