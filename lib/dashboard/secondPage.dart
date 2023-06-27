import 'dart:ui';

import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String title;
  final String description;

  const SecondPage({required this.title, required this.description});
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Hero(
                  tag: "images/denji.jpg",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "images/denji.jpg",
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  // ElevatedButton(
                  //   child: Text("Go BAck"),
                  //   onPressed: (() {
                  //     Navigator.pop(context,
                  //         MaterialPageRoute(builder: (context) => MyHomePage()));
                  //   }),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      children: [
                        Text(
                          description,
                          //softWrap: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(35),
                          child: TweenAnimation(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(35),
                          child: Heart(),
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      )
      //       child: Column(

      //           children: [
      //             // ElevatedButton(
      //             //   child: Text("Go BAck"),
      //             //   onPressed: (() {
      //             //     Navigator.pop(context,
      //             //         MaterialPageRoute(builder: (context) => MyHomePage()));
      //             //   }),
      //             // ),
      //             Padding(
      //               padding: const EdgeInsets.all(28),
      //               child: Column(
      //                 children: [
      //                   Text(
      //                     description,
      //                     //softWrap: true,
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(35),
      //                     child: Heart(),
      //                   )
      //                 ],
      //               ),
      //             )

      // ]),

      );
}

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
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
    );
  }
}

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _colorAnimation = ColorTween(begin: Colors.grey[200], end: Colors.red)
        .animate(_controller);

    _controller.addListener(() {
      print(_colorAnimation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(Icons.favorite, color: _colorAnimation.value, size: 80),
          onPressed: () {
            _controller.forward();
          },
        );
      },
    );
  }
}
