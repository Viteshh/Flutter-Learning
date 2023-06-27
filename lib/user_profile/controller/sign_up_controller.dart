import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool isLoading = false;

  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  final userConfirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> storeNewUser(User? user, String userName) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('users').doc(firebaseUser?.uid).set({
      'email': user?.email,
      'uid': user?.uid,
      'username': userName,
    }).then((value) {
      print('User data stored successfully!');
    }).catchError((e) {
      print('Error storing user data: $e');
    });
  }
}
