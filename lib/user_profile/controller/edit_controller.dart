import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/user_profile/save_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditController extends GetxController {
  late String profilePhotoUrl = "";

  // final storageRef = FirebaseStorage.instance.ref();
  final formKey = GlobalKey<FormState>();
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late PickedFile pickedImage;
  late String imageUpload;

  Future<void> uploadImage() async {
    ImagePicker imagePicker = ImagePicker();

    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    Reference referenceImage = referenceDirImages.child(fileName);
    // Reference referenceImage = FirebaseStorage.instance.refFromURL(_profilePhotoUrl['images']);

    await referenceImage.putFile(File(pickedImage.path));

    profilePhotoUrl = await referenceImage.getDownloadURL();

    imageUpload = profilePhotoUrl;

    print("User Added : $profilePhotoUrl");
  }

  void updateProfileData({required String uid}) async {
    if (formKey.currentState!.validate()) {
      // await uploadImage();
      // String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Reference referenceRoot = FirebaseStorage.instance.ref();
      // Reference referenceDirImages = referenceRoot.child('images');
      // Reference referenceImage = referenceDirImages.child(fileName);
      // await referenceImage.putFile(File(_pickedImage.path));
      // String profilePhotoUrl = await referenceImage.getDownloadURL();
      // Perform update in Firestore
      FirebaseFirestore.instance.collection('users').doc(uid).update({
        'username': userNameController.text,
        'aboutMe': aboutMeController.text,
        'profilePhotoUrl': profilePhotoUrl
      }).then((value) {
        print(userNameController.text);
        Get.to(() => SaveProfile(uid: uid));
        // Navigate back to ProfileDetails page
      }).catchError((error) {
        print('Error updating profile data: $error');
      });
    }
  }
}
