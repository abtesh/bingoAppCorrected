import 'package:flutter/material.dart';
import 'BingoCardDisplayScreen.dart';

class ConfirmationScreen extends StatefulWidget {
  final List<int> selectedCards;

  const ConfirmationScreen({super.key, required this.selectedCards});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  int _selectedPatternCount = 1; // Default to 1 pattern

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Selection'),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                shadowColor: Colors.lightBlue[100],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 30.0,
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.assignment_turned_in,
                          color: Colors.lightBlue[400], size: 54),
                      const SizedBox(height: 20),
                      Text(
                        'You\'ve selected ${widget.selectedCards.length} Bingo card${widget.selectedCards.length > 1 ? 's' : ''}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: widget.selectedCards.map((card) {
                          return Chip(
                            label: Text('Card $card'),
                            backgroundColor: Colors.lightBlue[100],
                            labelStyle: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w600,
                            ),
                            elevation: 2,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 30),
                      // Pattern Selection Dropdown
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How many patterns to win?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[50],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.lightBlue[300]!,
                                width: 1.5,
                              ),
                            ),
                            child: DropdownButton<int>(
                              value: _selectedPatternCount,
                              isExpanded: true,
                              underline: Container(),
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.blue[800]),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue[800],
                                fontWeight: FontWeight.w500,
                              ),
                              items: [0, 1, 2, 3].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    value == 0
                                        ? 'Don\'t Notify'
                                        : '$value Pattern${value > 1 ? 's' : ''} to Win',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  _selectedPatternCount = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BingoCardDisplayScreen(
                        cardNumbers: widget.selectedCards,
                        patternsToWin: _selectedPatternCount,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[400],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'START PLAYING',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Go back and change selection',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
