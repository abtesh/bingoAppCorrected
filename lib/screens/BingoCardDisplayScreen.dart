import 'package:flutter/material.dart';
import 'bingo_cards_data.dart';

class BingoCardDisplayScreen extends StatefulWidget {
  final List<int> cardNumbers;
  final int patternsToWin;

  const BingoCardDisplayScreen({super.key, required this.cardNumbers,     this.patternsToWin = 1, // Default to 1 pattern
  });

  @override
  _BingoCardDisplayScreenState createState() => _BingoCardDisplayScreenState();
}

class _BingoCardDisplayScreenState extends State<BingoCardDisplayScreen> {
  final Set<int> _markedNumbers = {};
  final Map<String, List<List<int>>> _winningPatterns = {};

  void _checkForBingo() {
    final newWinningPatterns = <String, List<List<int>>>{};

    for (var cardKey in widget.cardNumbers) {
      final cardKeyStr = cardKey.toString();
      final cardData = bingoCards[cardKeyStr]!;
      final patterns = _getAllPatterns(cardData);

      // Find all winning patterns for this card
      final winningPatterns = patterns.where((pattern) =>
          pattern.every((num) => num == 0 || _markedNumbers.contains(num))).toList();

      if (winningPatterns.isNotEmpty) {
        newWinningPatterns[cardKeyStr] = winningPatterns;
      }
    }

    setState(() => _winningPatterns
      ..clear()
      ..addAll(newWinningPatterns));
  }

  List<List<int>> _getAllPatterns(List<List<int>> cardData) {
    final patterns = <List<int>>[];

    // Rows
    patterns.addAll(cardData);

    // Columns
    for (int col = 0; col < 5; col++) {
      patterns.add([for (int row = 0; row < 5; row++) cardData[row][col]]);
    }

    // Diagonals
    patterns.add([for (int i = 0; i < 5; i++) cardData[i][i]]);
    patterns.add([for (int i = 0; i < 5; i++) cardData[i][4 - i]]);

    return patterns;
  }

  bool _isWinningNumber(String cardKey, int number) {
    return _winningPatterns[cardKey]?.any((pattern) => pattern.contains(number)) ?? false;
  }

  void _clearGame() {
    setState(() {
      _markedNumbers.clear();
      _winningPatterns.clear();
    });
  }

  Widget _buildCardCell(String cardKey, int number) {
    final isMarked = _markedNumbers.contains(number);
    final isWinning = _isWinningNumber(cardKey, number);
    final isFreeSpace = number == 0;

    return GestureDetector(
      onTap: () {
        if (!isFreeSpace) {
          setState(() => isMarked ? _markedNumbers.remove(number) : _markedNumbers.add(number));
          _checkForBingo();
        }
      },
      child: Container(
        margin: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: isFreeSpace
              ? Colors.blue[100]
              : isWinning
              ? Colors.red[300]
              : isMarked
              ? Colors.green[300]
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isWinning ? Colors.red : Colors.blueGrey,
            width: isWinning ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: isFreeSpace
            ? const Icon(Icons.star, color: Colors.amber, size: 22)
            : Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: isMarked || isWinning ? FontWeight.bold : FontWeight.normal,
              color: isMarked || isWinning ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bingo Cards'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _clearGame,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: widget.cardNumbers.length,
                  itemBuilder: (context, index) {
                    final cardKey = widget.cardNumbers[index].toString();
                    final cardData = bingoCards[cardKey]!;

                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Card $cardKey',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1976D2),
                              ),
                            ),
                            const SizedBox(height: 10),
                             Table(
                              children: [
                                TableRow(
                                  children: [
                                    _BingoHeaderCell('B'),
                                    _BingoHeaderCell('I'),
                                    _BingoHeaderCell('N'),
                                    _BingoHeaderCell('G'),
                                    _BingoHeaderCell('O'),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Expanded(
                              child: Table(
                                border: TableBorder.all(color: Colors.transparent),
                                children: cardData.map((row) => TableRow(
                                  children: row.map((number) => _buildCardCell(cardKey, number)).toList(),
                                )).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _clearGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Clear All Marks",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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

class _BingoHeaderCell extends StatelessWidget {
  final String letter;

  const _BingoHeaderCell(this.letter);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1976D2),
          ),
        ),
      ),
    );
  }
}