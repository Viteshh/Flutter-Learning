import 'package:first_app/demo/explicit_animation.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationDemo extends StatefulWidget {
  @override
  _ImplicitAnimationDemoState createState() => _ImplicitAnimationDemoState();
}

class _ImplicitAnimationDemoState extends State<ImplicitAnimationDemo> {
  double _width = 100;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animation Demo'),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _width = _width == 100 ? 200 : 100;
                  _height = _height == 100 ? 200 : 100;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _width,
                height: _height,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExplicitAnimationDemo()),
                );
              },
              child: Text(
                "EXPLICIT",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 108, 137),
                ),
              ))
        ],
      ),
    );
  }
}
