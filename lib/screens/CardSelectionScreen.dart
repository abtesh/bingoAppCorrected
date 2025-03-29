import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ConfirmationScreen.dart';

class CardSelectionScreen extends StatefulWidget {
  @override
  _CardSelectionScreenState createState() => _CardSelectionScreenState();
}

class _CardSelectionScreenState extends State<CardSelectionScreen> {
  final List<int> _selectedCards = []; // Stores selected card numbers (e.g., [1, 5, 10])

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Bingo Cards')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 cards per row
          childAspectRatio: 1.0,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 200, // Cards 1-200
        itemBuilder: (context, index) {
          final cardNumber = index + 1;
          final isSelected = _selectedCards.contains(cardNumber);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedCards.remove(cardNumber); // Deselect
                } else {
                  _selectedCards.add(cardNumber); // Select
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: Center(
                child: Text(
                  'Card $cardNumber',
                  style: TextStyle(
                    fontSize: 18,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: _selectedCards.isNotEmpty
          ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmationScreen(
                selectedCards: _selectedCards,
              ),
            ),
          );
        },
        child: Icon(Icons.check),
      )
          : null,
    );
  }
}