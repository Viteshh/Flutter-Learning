import 'package:first_app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class Counter extends StatelessWidget {
//   const Counter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final counter = Provider.of<CounterProvider>(context);
//     final count = counter.count;
//     return Scaffold(
//       body: Center(
//         child: Text(
//           "You Pressed button $count times",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 20),
//         child: FloatingActionButton(
//           onPressed: () {
//             counter.increment();
//           },
//           child: Icon(Icons.plus_one),
//         ),
//       ),
//     );
//   }
// }

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CurvedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: CustomPaint(
        size: Size(
            50,
            (1000)
                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),
      ),
    );
    // return ClipPath(
    //   clipper: TopCurveClipper(),
    //   child: Container(
    //     height: 100,
    //     decoration: BoxDecoration(
    //       color: Colors.blue,
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //   ),
    // );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(
        size.width * 0.9986702, size.height * 0.4776898); // reduced height
    path_0.cubicTo(
        size.width * 0.6027473,
        size.height * 0.509309,
        size.width * 0.3841676,
        size.height * 0.5055045,
        size.width * 0.001329710,
        size.height * 0.4776898); // reduced height
    path_0.lineTo(size.width * 0.001329814, size.height * -0.002457668);
    path_0.lineTo(size.width * 0.9986702, size.height * 0.003309935);
    path_0.lineTo(
        size.width * 0.9986702, size.height * 0.4776898); // reduced height
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffAFAAEF).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
