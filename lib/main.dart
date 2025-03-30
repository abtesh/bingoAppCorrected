import 'package:flutter/material.dart';
import 'package:new_bingo_app/screens/CardSelectionScreen.dart';
import 'package:new_bingo_app/screens/HomeScreen.dart';

void main() {
  runApp(BingoApp());
}

class BingoApp extends StatelessWidget {
  const BingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.light(
          primary: Colors.lightBlue[200]!,
          secondary: Colors.lightBlue[400]!,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue[300],
          elevation: 5,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.lightBlue[400],
        ),
      ),
      home: CardSelectionScreen(),
    );
  }
}