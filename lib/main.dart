import 'package:flutter/material.dart';
import 'package:new_bingo_app/screens/CardSelectionScreen.dart';
import 'package:new_bingo_app/screens/HomeScreen.dart';

void main() {
  runApp(BingoApp());
}

class BingoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardSelectionScreen(), // Changed from HomeScreen()
    );
  }
}