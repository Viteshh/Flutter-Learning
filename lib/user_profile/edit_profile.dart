import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/user_profile/controller/edit_controller.dart';
import 'package:first_app/user_profile/save_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final String uid;
  final String fullName;
  final String aboutMe;
  final String profilePhotoUrl;
  EditProfile(
      {required this.uid,
      required this.fullName,
      required this.aboutMe,
      required this.profilePhotoUrl});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final EditController editController = Get.put(EditController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("User Added : $editController.profilePhotoUrl");
    editController.userNameController.text = widget.fullName;
    editController.aboutMeController.text = widget.aboutMe;
    editController.profilePhotoUrl = widget.profilePhotoUrl;
  }

  // Future<void> updateUserProfile() async {
  //   // Retrieve the user's input values from the text controllers or any other sources
  //   String aboutMe = _aboutMeController.text;
  //   String fullName = _userNameController.text;

  //   // Update the user profile document in Firestore
  //   try {
  //     // Upload the new image if a new image is picked
  //     if (_pickedImage.path.isNotEmpty) {
  //       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //       Reference referenceRoot = FirebaseStorage.instance.ref();
  //       Reference referenceDirImages = referenceRoot.child('images');
  //       Reference referenceImage = referenceDirImages.child(fileName);
  //       await referenceImage.putFile(File(_pickedImage.path));
  //       String profilePhotoUrl = await referenceImage.getDownloadURL();

  //       // Update the user profile document with the new image URL
  //       await users.doc(widget.uid).update({
  //         'aboutMe': aboutMe,
  //         'fullName': fullName,
  //         'profilePhotoUrl': profilePhotoUrl,
  //       });
  //     } else {
  //       // If no new image is picked, update the user profile document without changing the image URL
  //       await users.doc(widget.uid).update({
  //         'aboutMe': aboutMe,
  //         'fullName': fullName,
  //       }).then((value) {
  // Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => SaveProfile(
  //               uid: widget.uid,
  //             )));
  //       });
  //     }
  //     print("update fullName: $fullName");
  //     // ignore: use_build_context_synchronously

  //     print('User profile updated successfully!');
  //   } catch (e) {
  //     print('Failed to update user profile: $e');
  //   }
  // }

  // Future<void> addUser() {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .add({
  //         'fullName': _userNameController.text, // John Doe
  //         'aboutMe': _aboutMeController.text, // Stokes and Sons
  //         'profilePhotoUrl': _profilePhotoUrl,
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  // List<String> profileData = [];

  // void saveDataToFirebase(List<String> userData) {
  //   final dataRef = FirebaseFirestore.instance.collection('users');
  //   // print("save hobby: $selectedHobbies");

  //   dataRef.doc('CVmuAnDAMsP67gG46W7cy3BPLZn1').update({
  //     'data': userData,
  //     'fullName': _userNameController.text,
  //     'aboutMe': _aboutMeController.text, // Stokes and Sons
  //     'profilePhotoUrl': _profilePhotoUrl,
  //   }).then((value) {
  //     // Success
  //   }).catchError((error) {
  //     // Handle error
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Profile"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: editController.formKey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xffFDCF09),
                  child: GestureDetector(
                    onTap: () {
                      editController.uploadImage();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: editController.profilePhotoUrl.isNotEmpty
                          ? Image.network(
                              editController.profilePhotoUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : editController.profilePhotoUrl.isNotEmpty
                              ? Image.file(
                                  File(editController.imageUpload),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/pfp.jpg",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                  child: TextFormField(
                    // key: UniqueKey(),
                    // focusNode: _focusNode,
                    controller: editController.userNameController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        // hintText: 'Title',
                        labelText: 'fullName',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.75,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some title';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                  child: TextFormField(
                    // key: UniqueKey(),
                    // focusNode: _focusNode,
                    controller: editController.aboutMeController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        // hintText: 'Title',
                        labelText: 'About Me',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.75,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some title';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: GestureDetector(
                    onTap: () {
                      editController.updateProfileData(uid: widget.uid);
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
                              "Edit",
                              textAlign: TextAlign.center,
                            )),
                            Icon(Icons.arrow_circle_right_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
