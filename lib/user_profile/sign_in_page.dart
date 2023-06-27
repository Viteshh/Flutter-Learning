import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/components/textfield.dart';
import 'package:first_app/user_profile/edit_profile.dart';
import 'package:first_app/user_profile/profile_detail.dart';
import 'package:first_app/user_profile/save_profile.dart';
import 'package:first_app/user_profile/sign_up_page.dart';
import 'package:first_app/user_profile/user_profile_page.dart';
import 'package:first_app/user_profile2/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:first_app/user_profile/controller/sign_in_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

// final _formKey2 = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: SingleChildScrollView(
            child: Center(
              child: controller.isLoading
                  ? CircularProgressIndicator()
                  : Form(
                      key: controller.formKey1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: MediaQuery.of(context).size.height * 0.20,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            "Sign In",
                            style: SignInController.myTextStyle,
                          ),
                          SizedBox(
                            // height: 16,
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          MyTextField(
                              controller: controller.userEmailController,
                              labelText: "Email",
                              prefix: Icons.email_outlined,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Email";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          PasswordFeild(
                              controller: controller.userPasswordController,
                              labelText: "Password",
                              prefix: Icons.lock_outline,
                              suffix: Icons.visibility_off_outlined,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Password";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Switch(
                                      value: controller.iSwitched,
                                      onChanged: controller.handleRemeberme

                                      // onChanged: (value) {
                                      //   setState(() {
                                      //     _handleRemeberme(value);
                                      //     // print(value);
                                      //     // iSwitched = value;
                                      //   });
                                      //   if (!value) {
                                      //     _clearloginInfo();
                                      //   }
                                      // }
                                      ),
                                  Text("Remember Me"),
                                ],
                              ),
                              Text("Forgot Password?")
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: GestureDetector(
                              onTap: () {
                                if (controller.formKey1.currentState!
                                    .validate()) {
                                  controller.formKey1.currentState!.save();
                                  setState(() {
                                    controller.isLoading = true;
                                  });
                                  late User? user;
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: controller
                                              .userEmailController.text,
                                          password: controller
                                              .userPasswordController.text)
                                      .then((value) => {
                                            setState(() {
                                              user = value.user;
                                              // Assign the logged-in user to the user variable
                                            }),
                                            print("LOgged In ${value.user}"),
                                            setState(() {
                                              controller.isLoading = false;
                                            }),
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SaveProfile(
                                                            uid: user!.uid)))
                                          });
                                }
                              },
                              child: Card(
                                color: Color.fromARGB(255, 94, 116, 255),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "SIGN IN",
                                        textAlign: TextAlign.center,
                                      )),
                                      Icon(Icons.arrow_circle_right_outlined)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Center(child: Text("OR")),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: GestureDetector(
                              onTap: () async {
                                // final GoogleSignIn googleUser = GoogleSignIn();
                                final UserCredential userCredential =
                                    await controller.signInWithGoogle();
                                final User? user = userCredential.user;

                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileDetails(
                                              user: user,
                                            )));
                              },
                              child: Card(
                                color: Color.fromARGB(255, 255, 255, 255),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 12, bottom: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/images/gg.png",
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        fit: BoxFit.fill,
                                      ),
                                      Text("Login With Google")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: GestureDetector(
                              onTap: () async {
                                await controller.signInWithFacebook();
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()));
                              },
                              child: Card(
                                color: Color.fromARGB(255, 255, 255, 255),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 12, bottom: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/images/facebook.png",
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        fit: BoxFit.fill,
                                      ),
                                      Text("Login With Facebook")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()));
                                },
                                child: Text(
                                  " Sign Up",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 125, 143, 255),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
