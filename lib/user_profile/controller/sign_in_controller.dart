import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/user_profile/save_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  bool isLoading = false;

  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  bool iSwitched = false;
  final formKey1 = GlobalKey<FormState>();
  // ignore: unused_element

  //Remember ME
  void handleRemeberme(bool value) {
    print("Handle Rember Me");
    iSwitched = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', userEmailController.text);
        prefs.setString('password', userPasswordController.text);
      },
    );

    iSwitched = value;
  }

  @override
  void onInit() {
    super.onInit();
    checkLoggedInUser();

    _loadRememberMe();
  }

  void checkLoggedInUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is already logged in, navigate to the profile page
      Get.offAll(SaveProfile(uid: user.uid));
    }
  }

//Facebook Sign In
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  static const myTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

//Clear Login Details
  void clearloginInfo() {
    userEmailController.clear();
    userPasswordController.clear();
  }

  //Google Sign In
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final User? user = userCredential.user;

    if (user != null) {
      // Check if the user already exists in Firestore
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      final userSnapshot = await userDoc.get();

      if (!userSnapshot.exists) {
        // If the user does not exist, save their data to Firestore
        // final googleSignInData = googleUser?.googleSignInAccount;
        final username = user.displayName ?? '';
        final profilePhotoUrl = user.photoURL ?? '';

        await userDoc.set({
          'uid': user.uid,
          'email': user.email,
          // 'username': username,
          'profilePhoto': profilePhotoUrl,
        });
      }
    }

    // Return the UserCredential
    return userCredential;
    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void _loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var rememberMe = prefs.getBool('remember_me') ?? false;
    var email = prefs.getString('email') ?? "";
    var password = prefs.getString('password') ?? "";

    // print(remeberMe);
    print(email);
    print(password);

    if (rememberMe) {
      iSwitched = true;

      userEmailController.text = email;
      userPasswordController.text = password;
    }
  }
}
