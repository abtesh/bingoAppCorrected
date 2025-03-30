import 'package:flutter/material.dart';

import 'BingoCardDisplayScreen.dart';

// class CardInputScreen extends StatefulWidget {
//   final int numberOfCards;
//
//   CardInputScreen({required this.numberOfCards});
//
//   @override
//   _CardInputScreenState createState() => _CardInputScreenState();
// }
//
// class _CardInputScreenState extends State<CardInputScreen> {
//   final List<TextEditingController> _controllers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < widget.numberOfCards; i++) {
//       _controllers.add(TextEditingController());
//     }
//   }
//
//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Card Numbers'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             for (int i = 0; i < widget.numberOfCards; i++)
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextField(
//                   controller: _controllers[i],
//                   decoration: InputDecoration(
//                     labelText: 'Enter Card Number ${i + 1} (1-200)',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submitCardNumbers,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _submitCardNumbers() {
//     List<int> cardNumbers = [];
//     for (var controller in _controllers) {
//       int? cardNumber = int.tryParse(controller.text);
//       if (cardNumber == null || cardNumber < 1 || cardNumber > 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Please enter valid card numbers (1-200)')),
//         );
//         return;
//       }
//       cardNumbers.add(cardNumber);
//     }
//
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => BingoCardDisplayScreen(cardNumbers: cardNumbers),
//       ),
//     );
//   }
// }