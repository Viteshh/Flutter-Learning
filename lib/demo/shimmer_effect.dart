// import 'package:flutter/material.dart';

// import 'package:shimmer/shimmer.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shimmer Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Shimmer Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Shimmer.fromColors(
//                 baseColor: Color.grey[300],
//                 highlightColor: Color.grey[100],
//                 child: Text(
//                   'Shimmer Effect',
//                   style: TextStyle(fontSize: 40.0),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Shimmer.fromColors(
//                 baseColor: Color.grey[300],
//                 highlightColor: Color.grey[100],
//                 child: Container(
//                   width: 200.0,
//                   height: 200.0,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(100.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
