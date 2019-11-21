import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _xylophoneKey(noteNumber: 1, color: Colors.red),
              _xylophoneKey(noteNumber: 2, color: Colors.orange),
              _xylophoneKey(noteNumber: 3, color: Colors.yellow),
              _xylophoneKey(noteNumber: 4, color: Colors.green),
              _xylophoneKey(noteNumber: 5, color: Colors.teal),
              _xylophoneKey(noteNumber: 6, color: Colors.blue),
              _xylophoneKey(noteNumber: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }

  Widget _xylophoneKey({@required int noteNumber, @required Color color}) {
    return Expanded(
      child: FlatButton(
        child: Container(),
        color: color,
        onPressed: () {
          final player = AudioCache(prefix: 'sounds/');
          player.play('note$noteNumber.wav');
        },
      ),
    );
  }
}
