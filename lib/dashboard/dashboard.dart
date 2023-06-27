import 'package:first_app/animations/hero.dart';
import 'package:first_app/animations/tween.dart';
import 'package:first_app/dashboard/home_page.dart';
import 'package:flutter/material.dart';
import 'package:first_app/dashboard/silverappbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          backgroundColor: Colors.amber[100],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Container(
                  padding: EdgeInsetsDirectional.all(8),
                  color: Colors.red[600],
                  child: Center(child: Text("First Demo App")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TweenAnimation()));
                },
                child: Container(
                  padding: EdgeInsetsDirectional.all(8),
                  color: Colors.red[400],
                  child: Center(child: Text("Tween Animation")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HeroPage(
                            tag: "photo",
                          )));
                },
                child: Container(
                  padding: EdgeInsetsDirectional.all(8),
                  color: Colors.red[300],
                  child: Center(child: Text("Hero Animation")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsetsDirectional.all(8),
                color: Colors.red[200],
                child: Center(child: Text("Staggered Animation")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SliverAppBarExample()));
                },
                child: Container(
                  padding: EdgeInsetsDirectional.all(8),
                  color: Colors.red[400],
                  child: Center(child: Text("SilverAppBar")),
                ),
              ),
            ),
          ],
        ),

        // body: GridView(
        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //       maxCrossAxisExtent: 200,
        //       childAspectRatio: 3 / 2,
        //       crossAxisSpacing: 20,
        //       mainAxisSpacing: 20),
        //   children: Topiclist.map((dashboardList) =>
        //       DashboardList(dashboardList.title, dashboardList.color)).toList(),
        // ),
      );
}
