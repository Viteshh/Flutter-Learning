import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/practice/counter.dart';
import 'package:first_app/provider/counter_provider.dart';
import 'package:first_app/practice/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../practice/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 108, 137),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 30,
                right: 15,
              ),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                            builder: ((context) => UserDashboard())));
                      },
                      child: Icon(Icons.arrow_back,
                          color: Color.fromARGB(255, 255, 254, 254))),
                  SizedBox(width: 20),
                  Text("Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Color.fromARGB(255, 255, 254, 254)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      blurStyle: BlurStyle.outer,
                      color: Color.fromARGB(255, 114, 114, 114))
                ], borderRadius: BorderRadius.circular(8), color: Colors.white),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: '79*******3',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 5, color: Colors.white),
                                // borderRadius: BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/pfp.jpg")),
                                shape: BoxShape.circle,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () {},
                              child: Text("Update",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 255, 108, 137))))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            //second Container
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          blurStyle: BlurStyle.outer,
                          color: Color.fromARGB(255, 114, 114, 114))
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 240, 240, 240)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("MY PROFILE"),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14, top: 10, bottom: 10, right: 14),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  color: Color.fromARGB(255, 255, 108, 137),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Vitesh Pawar"),
                                Spacer(),
                                Icon(Icons.edit)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14, top: 10, bottom: 10, right: 14),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.password,
                                  color: Color.fromARGB(255, 255, 108, 137),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(child: Text("Change Password"))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14, top: 10, bottom: 10, right: 14),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  color: Color.fromARGB(255, 255, 108, 137),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Counter")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14, top: 10, bottom: 10, right: 14),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thumb_up,
                                  color: Color.fromARGB(255, 255, 108, 137),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Rating the App")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14, top: 10, bottom: 10, right: 14),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Color.fromARGB(255, 255, 108, 137),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Share this App")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14, top: 10, bottom: 10, right: 14),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Color.fromARGB(255, 255, 108, 137),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      FirebaseAuth.instance
                                          .signOut()
                                          .then((value) {
                                        print("Signed Out");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()),
                                        );
                                      });
                                    },
                                    child: Text("Log Out"))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
