import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key, required tag});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HeroPage1(
                  tag: "photo",
                )));
      },
      child: Hero(
        tag: "photo",
        child: Image.asset(
          "images/photo.png",
          height: 90,
        ),
      ),
    ));
  }
}

class HeroPage1 extends StatelessWidget {
  const HeroPage1({super.key, required tag});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HeroPage(
                      tag: "photo",
                    )));
          },
          child: Hero(
            tag: "photo",
            child: Image.asset("images/photo.png"),
          ),
        )),
      ],
    );
  }
}
