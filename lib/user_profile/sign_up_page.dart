import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/components/textfield.dart';
import 'package:first_app/user_profile/controller/sign_up_controller.dart';
import 'package:first_app/user_profile/edit_profile.dart';
import 'package:first_app/user_profile/profile_detail.dart';
import 'package:first_app/user_profile/save_profile.dart';
import 'package:first_app/user_profile/sign_in_page.dart';
import 'package:first_app/user_profile/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 25),
                      child: GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: Icon(Icons.arrow_back)),
                    ),
                    Text(
                      "Sign Up",
                      // style: myTextStyle,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    // UserNameField(
                    //   controller: _userNameController,
                    //   labelText: "Username",
                    //   prefix: Icons.person_outline,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return "Please Enter Username";
                    //     }
                    //     return null;
                    //   },
                    //   // onFieldSubmitted: (value) {
                    //   //   _formKey.currentState!.validate();
                    //   // },
                    // ),
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
                    PasswordFeild(
                        controller: controller.userConfirmPasswordController,
                        labelText: "Confirm Password",
                        prefix: Icons.lock_outline,
                        suffix: Icons.visibility_off_outlined,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password';
                          }

                          // ignore: unrelated_type_equality_checks
                          else if (value !=
                              controller.userPasswordController.text) {
                            return 'Passwords do not match';
                          }

                          controller.userConfirmPasswordController.text = value;
                          return null;
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: GestureDetector(
                        onTap: () async {
                          if (controller.formKey.currentState!.validate()) {
                            User? user;
                            try {
                              setState(() {
                                controller.isLoading = true;
                              });

                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                email: controller.userEmailController.text,
                                password:
                                    controller.userPasswordController.text,
                              );
                              user = userCredential.user;
                              controller.storeNewUser(
                                  user, controller.userNameController.text);
                              print('New account created');
                              setState(() {
                                controller.isLoading = false;
                              });

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileDetails(user: user),
                                ),
                              );
                            } catch (e) {
                              print('Error creating account: $e');
                            }
                          }
                        },
                        child: Card(
                          color: Color.fromARGB(255, 94, 116, 255),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'SIGN UP',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Icon(Icons.arrow_circle_right_outlined),
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
                        onTap: () {
                          // signInWithGoogle();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => UserProfile()));
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 12, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/gg.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
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
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 12, bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/facebook.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                fit: BoxFit.fill,
                              ),
                              Text("Login With Facebook")
                            ],
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
                        Text("Already have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            "Sign IN",
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
