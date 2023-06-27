import 'package:first_app/practice/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  bool password = true;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Image.asset(
                    "assets/images/image5.png",
                    height: MediaQuery.of(context).size.height * 0.26,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                // width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.86,
                // height: MediaQuery.of(context).size.height / 1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 20, bottom: 20),
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
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: "Type your name here....",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(179, 213, 212, 212)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 250, 250, 250)))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Mobile Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black45),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 70,
                              child: TextField(
                                maxLength: 4,
                                decoration: InputDecoration(
                                    hintText: "+91",
                                    counterText: " ",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(179, 213, 212, 212)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 250, 250, 250)))),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 70,
                              child: TextField(
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    hintText: "98XXXXXXXX",
                                    counterText: " ",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(179, 213, 212, 212)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 250, 250, 250)))),
                              ),
                            ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "Create Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black45),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          controller: _passwordController1,
                          obscureText: password,
                          decoration: InputDecoration(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 250, 250, 250)))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   "Confirm Password",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 14,
                      //       color: Colors.black45),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // SizedBox(
                      //   height: 50,
                      //   child: TextField(
                      //     controller: _textEditingController3,
                      //     obscureText: password,
                      //     decoration: InputDecoration(
                      //         hintText: "********",
                      //         hintStyle: TextStyle(
                      //             color: Color.fromARGB(179, 213, 212, 212)),
                      //         suffix: IconButton(
                      //           icon: Icon(password
                      //               ? Icons.visibility_off
                      //               : Icons.visibility),
                      //           onPressed: () {
                      //             setState(() {
                      //               password = !password;
                      //               // print(password);
                      //             });
                      //           },
                      //         ),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide: BorderSide(
                      //                 color:
                      //                     Color.fromARGB(255, 250, 250, 250)))),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                });
                              }),
                          Expanded(
                            flex: 4,
                            child: RichText(
                                text: TextSpan(
                                    text: "About Our ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    children: [
                                  TextSpan(
                                      text: "Terms & Conditions ",
                                      style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      )),
                                  TextSpan(
                                      text: "and ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      )),
                                  TextSpan(
                                      text: "Policy",
                                      style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ))
                                ])),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                            width: 200,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurpleAccent,
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
                                      .createUserWithEmailAndPassword(
                                          email: _emailController.text,
                                          password: _passwordController1.text)
                                      .then((value) {
                                    print("create new account");
                                    // if (_emailController.text.isEmpty) {
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(SnackBar(
                                    //     content: Text(
                                    //         "Please Enter Correct Information"),
                                    //     duration: Duration(milliseconds: 500),
                                    //   ));
                                    // } else if (_passwordController1
                                    //     .text.isEmpty) {
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(SnackBar(
                                    //     content: Text(
                                    //         "Please Enter Correct Information"),
                                    //     duration: Duration(milliseconds: 500),
                                    //   ));
                                    // } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
                                  });
                                  // });
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 251, 251, 251),
                                  ),
                                ))),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
