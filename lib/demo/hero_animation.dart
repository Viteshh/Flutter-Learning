import 'package:flutter/material.dart';

class HeroAnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation Demo'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          6,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(index),
                ),
              );
            },
            child: Hero(
              tag: 'hero$index',
              child: Container(
                margin: EdgeInsets.all(8.0),
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int index;

  DetailScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Hero(
          tag: 'hero$index',
          child: Container(
            margin: EdgeInsets.all(8.0),
            color: Colors.blue,
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
