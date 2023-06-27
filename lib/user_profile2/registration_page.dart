// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';

// class User {
//   final String uid;
//   final String email;
//   String? photoUrl;
//   String? username;
//   String? aboutMe;

//   User({
//     required this.uid,
//     required this.email,
//     this.photoUrl,
//     this.username,
//     this.aboutMe,
//   });

//   // ...

//    Future<void> updateProfileInFirestore() async {
//     try {
//       CollectionReference users =
//           FirebaseFirestore.instance.collection('users');
//       await users.doc(uid).update({
//         'username': username,
//         'aboutMe': aboutMe,
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

// class AuthService {
//   // ...

//   Future<User?> registerWithEmailAndPassword(
//       String email, String password, String? photoUrl, String? username, String? aboutMe) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = result.user;

//       if (user != null) {
//         user.photoUrl = photoUrl;
//         user.username = username;
//         user.aboutMe = aboutMe;

//         await user.createUserInFirestore(); // Create user in Firestore
//         return User(uid: user.uid, email: user.email!, photoUrl: user.photoUrl, username: user.username, aboutMe: user.aboutMe);
//       }
//     } catch (e) {
//       print(e.toString());
//     }

//     return null;
//   }
// }



// // ignore: unused_element
// class _RegisterScreenState extends State<RegisterScreen> {
//   // ...

//   String? photoUrl;
//   String? username;
//   String? aboutMe;

 

//   @override
//   Widget build(BuildContext context) {
//     // ...

//     var _formKey;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // Existing fields (email and password)
//               // ...

//               TextFormField(
//                 onChanged: (val) {
//                   setState(() => username = val);
//                 },
//                 decoration: InputDecoration(labelText: 'Username'),
//               ),
//               TextFormField(
//                 onChanged: (val) {
//                   setState(() => aboutMe = val);
//                 },
//                 decoration: InputDecoration(labelText: 'About Me'),
//               ),
//               TextFormField(
//                 onChanged: (val) {
//                   setState(() => photoUrl = val);
//                 },
//                 decoration: InputDecoration(labelText: 'Profile Photo URL'),
//               ),

//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   // ...

//                   dynamic result = await _auth.registerWithEmailAndPassword(
//                       email, password, photoUrl, username, aboutMe);

//                   // ...
//                 },
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
