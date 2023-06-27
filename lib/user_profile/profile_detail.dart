import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/user_profile/save_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ProfileDetails extends StatefulWidget {
  final User? user;

  const ProfileDetails({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class ProfileDetailsController extends GetxController {}

class _ProfileDetailsState extends State<ProfileDetails> {
  late String? _profilePhotoUrl = "";

  // final storageRef = FirebaseStorage.instance.ref();

  TextEditingController _aboutMeController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late PickedFile _pickedImage;
  late String imageUpload;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("User Added : $_profilePhotoUrl");
  }

  //Save Profile Functionality
  Future<void> saveProfileDetails(User user) async {
    String uid = user.uid;

    await users.doc(uid).update({
      'username': _userNameController.text,
      'aboutMe': _aboutMeController.text,
      'profilePhotoUrl': _profilePhotoUrl
    }).then((value) {
      print('Profile details saved successfully!');
    }).catchError((e) {
      print('Error saving profile details: $e');
    });
  }

  // String? userId = FirebaseAuth.instance.currentUser?.uid;

  // if (userId != null) {
  //   // Use the userId for further operations (e.g., fetching user data from Firestore)
  // } else {
  //   // User is not logged in or currentUser is null
  // }

  //Upload Image Functionality
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

    _profilePhotoUrl = await referenceImage.getDownloadURL();
    print("User Added : $_profilePhotoUrl");
    setState(() {
      imageUpload = _profilePhotoUrl!;
    });
  }

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
          child: Column(
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: GestureDetector(
                  onTap: () {
                    uploadImage();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: _profilePhotoUrl!.isNotEmpty
                        ? Image.file(
                            File(imageUpload),
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
                  controller: _userNameController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      // hintText: 'Title',
                      labelText: 'UserName',
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
                  controller: _aboutMeController,
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
                    // if (_formKey.currentState!.validate()) {
                    saveProfileDetails(widget.user!);
                    print('Profile details saved');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SaveProfile(uid: widget.user!.uid)));
                    // Add navigation logic to the next page here
                    // }
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
                              'Submit',
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
            ],
          ),
        ),
      ),
    );
  }
}
