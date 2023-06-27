import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/practice/signup_screen.dart';
import 'package:first_app/practice/user_dashboard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool password = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    print(password);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 108, 137),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.86,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                children: [
                  Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        // heightFactor: 0.5,
                        child: Image.asset("assets/images/image4.png",
                            // height: screenHeight * 0.2,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black45),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                hintText: "Type your email here....",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(179, 213, 212, 212)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 250, 250, 250)))),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black45),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          // width: MediaQuery.of(context).size.width / 1.7,
                          child: TextField(
                            controller: _passwordController1,
                            maxLength: 8,
                            obscureText: password,
                            decoration: InputDecoration(
                                counterText: " ",
                                hintText: "********",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(179, 213, 212, 212)),
                                suffix: IconButton(
                                  icon: Icon(password
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      password = !password;
                                      // print(password);
                                    });
                                  },
                                ),
                                // suffix: Icon(Icons.visibility),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 250, 250, 250)))),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Center(child: Text("Forget Password?")),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Center(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 255, 108, 137),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    onPressed: () {
                                      if (_emailController.text.isEmpty ||
                                          _passwordController1.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'Please enter your email and password.'),
                                        ));
                                      }

                                      FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController1.text)
                                          .then((value) {
                                        // if (_emailController.text.isEmpty) {
                                        //   print("email");
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(SnackBar(
                                        //     content: Text(
                                        //         "Please Enter Correct Information"),
                                        //     duration:
                                        //         Duration(milliseconds: 500),
                                        //   ));
                                        // } else if (_passwordController1
                                        //     .text.isEmpty) {
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(SnackBar(
                                        //     content: Text(
                                        //         "Please Enter Correct Information"),
                                        //     duration:
                                        //         Duration(milliseconds: 500),
                                        //   ));
                                        // } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserDashboard()),
                                        );
                                      });
                                      // });
                                    },
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ))))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "OR",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 108, 137),
                      ),
                    ))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }
  // Future SignIn() async {
  //   await FirebaseAuth.

  // }
}
