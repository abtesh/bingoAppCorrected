// Helper widget for header cells
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _BingoHeaderCell extends StatelessWidget {
  final String letter;

  const _BingoHeaderCell(this.letter);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.blue[50],
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
      ),
    );
  }
}