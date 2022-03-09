import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const DiceGameApp());

class DiceGameApp extends StatelessWidget {
  const DiceGameApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade400,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade500,
          centerTitle: true,
          title: const Text('Random Dice'),
        ),
        body: const Board(),
      ),
    );
  }
}

class Board extends StatefulWidget {
  const Board({
    Key? key,
  }) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final Random _random = Random();

  int _left = 1;
  int _right = 1;

  void _onPressed() {
    setState(() {
      _left = _random.nextInt(6) + 1;
      _right = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Dice(
            number: _left,
            onPressed: _onPressed,
          ),
          Dice(
            number: _right,
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}

class Dice extends StatelessWidget {
  const Dice({
    Key? key,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  final int number;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Image.asset('assets/images/dice$number.png'),
      ),
    );
  }
}
