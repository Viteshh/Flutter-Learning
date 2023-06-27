import 'dart:ui';

import 'package:first_app/dashboard/profilepage.dart';
import 'package:first_app/practice/login_screen.dart';
import 'package:first_app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/container.png"))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 30,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "VITESH, GOOD MORNING",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.white),
                          // borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage("assets/images/pfp.jpg")),
                          shape: BoxShape.circle,
                        )),
                  ],
                ),
              ),
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(16, 200, 16, 16),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 2,
              //             // offset: Offset(0, 3),
              //             blurStyle: BlurStyle.outer,
              //             color: Color.fromARGB(255, 136, 136, 136),
              //           )
              //         ],
              //       ),
              //       child: HorizontalSlidableButton(
              //         width: MediaQuery.of(context).size.width / 1.3,
              //         buttonWidth: 90.0,
              //         border: Border.all(color: Colors.white, width: 2),
              //         borderRadius: BorderRadius.circular(5),
              //         color: Color.fromARGB(255, 255, 255, 255),
              //         buttonColor: Color.fromARGB(255, 59, 225, 145),
              //         dismissible: false,
              //         label: Center(
              //             child: Text('Swipe',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 13,
              //                     color: Color.fromARGB(255, 255, 255, 255)))),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text('Level 1',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 13,
              //                       color: Color.fromARGB(255, 59, 225, 145))),
              //               Text('Level 2',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 13,
              //                       color: Color.fromARGB(255, 59, 225, 145))),
              //             ],
              //           ),
              //         ),
              //         onChanged: (position) {
              //           setState(() {});
              //         },
              //       ),
              //     ),
              //   ),
              // ),

              //tab bar
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 200, 16, 16),
                  child: DefaultTabController(
                      length: 2,
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                // offset: Offset(0, 3),
                                blurStyle: BlurStyle.outer,
                                color: Color.fromARGB(255, 136, 136, 136),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.white),
                        child: TabBar(

                            // indicatorColor: Color.fromARGB(255, 59, 225, 145),
                            indicator: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 59, 225, 145),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(
                                text: "Level 1",
                              ),
                              Tab(text: "Level 2")
                            ]),
                      )),
                ),
              )
            ]),
            //Middle Container
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 4,
                child: Container(
                  width: double.infinity,
                  // height: 100,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow()],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => CurvedContainer())));
                              },
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6,
                                          blurStyle: BlurStyle.outer,
                                          color: Color.fromARGB(
                                              255, 203, 203, 203),
                                        )
                                      ],
                                      color: Color.fromARGB(255, 255, 18, 109),
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 4, color: Colors.white)),
                                  child: Icon(
                                    Icons.play_circle_outline_outlined,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  )),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Live Classes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 196, 196, 196)))
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6,
                                        blurStyle: BlurStyle.outer,
                                        color:
                                            Color.fromARGB(255, 203, 203, 203),
                                      )
                                    ],
                                    color: Color.fromARGB(255, 232, 129, 255),
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 4, color: Colors.white)),
                                child: Icon(
                                  Icons.layers,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Result",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 196, 196, 196)))
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6,
                                        blurStyle: BlurStyle.outer,
                                        color:
                                            Color.fromARGB(255, 203, 203, 203),
                                      )
                                    ],
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 4, color: Colors.white)),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                ProfilePage())));
                                  },
                                  child: Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.white,
                                  ),
                                )),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 196, 196, 196)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //Row Container
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Card(
                        color: Colors.deepPurpleAccent,
                        elevation: 6,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 120,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset(
                                  "assets/images/onlinelec.png",
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text("Online Classes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color.fromARGB(255, 196, 196, 196))),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Card(
                        color: Color.fromARGB(255, 252, 228, 255),
                        elevation: 6,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset(
                                  "assets/images/image1.png",
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text("Easy Learning",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color.fromARGB(255, 196, 196, 196))),
                    ],
                  ),
                ],
              ),
            ),

            //Bottom Two Container
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/container.png")),
                      boxShadow: [BoxShadow()],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/image3.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text("Study Material",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/images/container.png",
                          ),
                          colorFilter: ColorFilter.mode(
                              Color.fromARGB(255, 255, 113, 191),
                              BlendMode.color)),
                      boxShadow: [BoxShadow()],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/image2.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text("Group Activites",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
