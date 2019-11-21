import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void _changeDiceNumbers() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset('assets/img/dice$leftDiceNumber.png'),
            ),
            Container(
              width: 16,
            ),
            Expanded(
              child: Image.asset('assets/img/dice$rightDiceNumber.png'),
            ),
          ],
        ),
        onPressed: _changeDiceNumbers,
      ),
    );
  }
}
