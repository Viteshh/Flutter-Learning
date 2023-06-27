import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Go Back")),
            SizedBox(width: 10),
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween<double>(begin: 30, end: 100),
              duration: Duration(seconds: 1),
              builder: ((context, value, child) {
                return Icon(Icons.flash_on, color: Colors.red, size: value);
                // return ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: Image.asset(
                //     "images/denjiPowerr.jpg",
                //   ),
                // );
              }),
            )
          ],
        ),
      ),
    );
  }
}
