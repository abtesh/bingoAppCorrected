import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ConfirmationScreen.dart';
class CardSelectionScreen extends StatefulWidget {
  const CardSelectionScreen({super.key});

  @override
  _CardSelectionScreenState createState() => _CardSelectionScreenState();
}

class _CardSelectionScreenState extends State<CardSelectionScreen> {
  final List<int> _selectedCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dallol Bingo'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue[50]!, Colors.lightBlue[100]!],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select your Bingo cards (1-200)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[800],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8, // Reduced from 10 to make cells wider
                  childAspectRatio: 0.8, // Wider cells (0.8 width/height ratio)
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: 200,
                itemBuilder: (context, index) {
                  final cardNumber = index + 1;
                  final isSelected = _selectedCards.contains(cardNumber);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedCards.remove(cardNumber);
                        } else {
                          _selectedCards.add(cardNumber);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.lightBlue[400] : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? Colors.blue[800]! : Colors.lightBlue[300]!,
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '$cardNumber',
                          style: TextStyle(
                            fontSize: cardNumber > 99 ? 14 : 16, // Smaller font for 3-digit numbers
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.white : Colors.blue[800],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_selectedCards.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[400],
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      'Continue (${_selectedCards.length} selected)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}