// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_app/user_profile/save_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignInPage extends GetView<SignInController> {
//   const SignInPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.05,
//               vertical: MediaQuery.of(context).size.height * 0.02),
//           child: SingleChildScrollView(
//             child: Center(
//               child: Obx(
//                 () => controller.isLoading.value
//                     ? CircularProgressIndicator()
//                     : Form(
//                         key: controller.formKey1,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Center(
//                               child: Image.asset(
//                                 "assets/images/logo.png",
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.20,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             Text(
//                               "Sign In",
//                               style: controller.myTextStyle,
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             MyTextField(
//                               controller: controller.userEmailController,
//                               labelText: "Email",
//                               prefix: Icons.email_outlined,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Please Enter Email";
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             PasswordFeild(
//                               controller: controller.userPasswordController,
//                               labelText: "Password",
//                               prefix: Icons.lock_outline,
//                               suffix: Icons.visibility_off_outlined,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Please Enter Password";
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     // Switch(
//                                     //   value: controller.iSwitched,
//                                     //   onChanged: controller.handleRememberMe,
//                                     // ),
//                                     Text("Remember Me"),
//                                   ],
//                                 ),
//                                 Text("Forgot Password?")
//                               ],
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 25, right: 25),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (controller.formKey1.currentState!
//                                       .validate()) {
//                                     controller.formKey1.currentState!.save();
//                                     controller.isLoading.value = true;
//                                     controller.login().then((user) {
//                                       controller.isLoading.value = false;
//                                       if (user != null) {
//                                         Get.off(SaveProfile(uid: user.uid));
//                                       }
//                                     });
//                                   }
//                                 },
//                                 child: Card(
//                                   color: Color.fromARGB(255, 94, 116, 255),
//                                   elevation: 2,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(14),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             "SIGN IN",
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ),
//                                         Icon(Icons.arrow_circle_right_outlined)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             Center(child: Text("OR")),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 25, right: 25, top: 15),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   controller.googleSignIn().then((user) {
//                                     if (user != null) {
//                                       Get.off(SaveProfile(uid: user.uid));
//                                     }
//                                   });
//                                 },
//                                 child: Card(
//                                   color: Color.fromARGB(255, 217, 83, 79),
//                                   elevation: 2,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(14),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             "SIGN IN WITH GOOGLE",
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ),
//                                         Icon(Icons.arrow_circle_right_outlined)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.02,
//                             ),
//                             Center(
//                                 child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Don't have an account?"),
//                                 // TextButton(
//                                 //   // onPressed: () {
//                                 //   //   Get.to(SignUp());
//                                 //   // },
//                                 //   child: Text(
//                                 //     "Sign Up",
//                                 //     style: TextStyle(
//                                 //       decoration: TextDecoration.underline,
//                                 //     ),
//                                 //   ),
//                                 // ),
//                               ],
//                             )),
//                           ],
//                         ),
//                       ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class SignInController extends GetxController {
// //   final formKey1 = GlobalKey<FormState>();
// //   final TextEditingController userEmailController = TextEditingController();
// //   final TextEditingController userPasswordController = TextEditingController();
// //   late final isLoading = false.obs;
// //   final iSwitched = false.obs;

// //   final TextStyle myTextStyle =
// //       TextStyle(fontFamily: 'Arial', fontSize: 22, color: Colors.black);

// //   void handleRememberMe(bool value) {
// //     iSwitched.value = value;
// //   }

// //   Future<User?> login() async {
// //     // Your login logic here
// //   }

// //   Future<User?> googleSignIn() async {
// //     // Your Google sign-in logic here
// //   }

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     // Register the controller with GetX
// //     Get.put<SignInController>(this);
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     userEmailController.dispose();
// //     userPasswordController.dispose();
// //   }
// // }

// class MyTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final IconData prefix;
//   final FormFieldValidator<String>? validator;

//   const MyTextField({
//     Key? key,
//     required this.controller,
//     required this.labelText,
//     required this.prefix,
//     this.validator,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(prefix),
//         labelText: labelText,
//         border: OutlineInputBorder(),
//       ),
//       validator: validator,
//     );
//   }
// }

// class PasswordFeild extends StatefulWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final IconData prefix;
//   final IconData suffix;
//   final FormFieldValidator<String>? validator;

//   const PasswordFeild({
//     Key? key,
//     required this.controller,
//     required this.labelText,
//     required this.prefix,
//     required this.suffix,
//     this.validator,
//   }) : super(key: key);

//   @override
//   _PasswordFeildState createState() => _PasswordFeildState();
// }

// class _PasswordFeildState extends State<PasswordFeild> {
//   bool isObscure = true;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(widget.prefix),
//         labelText: widget.labelText,
//         border: OutlineInputBorder(),
//         suffixIcon: GestureDetector(
//           onTap: () {
//             setState(() {
//               isObscure = !isObscure;
//             });
//           },
//           child: Icon(isObscure ? widget.suffix : Icons.visibility),
//         ),
//       ),
//       obscureText: isObscure,
//       validator: widget.validator,
//     );
//   }
// }
