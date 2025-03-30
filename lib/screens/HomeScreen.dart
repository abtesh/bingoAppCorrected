// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'CardInputScreen.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bingo App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Choose the number of Bingo cards:'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _navigateToCardInputScreen(context, 1),
//               child: Text('1 Card'),
//             ),
//             ElevatedButton(
//               onPressed: () => _navigateToCardInputScreen(context, 2),
//               child: Text('2 Cards'),
//             ),
//             ElevatedButton(
//               onPressed: () => _navigateToCardInputScreen(context, 4),
//               child: Text('4 Cards'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _navigateToCardInputScreen(BuildContext context, int numberOfCards) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CardInputScreen(numberOfCards: numberOfCards),
//       ),
//     );
//   }
// }