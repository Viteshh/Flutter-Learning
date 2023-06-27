import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:first_app/user_profile/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:first_app/user_profile/edit_profile.dart';

// class UserProfile extends StatefulWidget {
//   const UserProfile({super.key});

//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
//   File? _photo;
//   bool _isEditing = false;
//   TextEditingController _aboutMeController = TextEditingController();
//   TextEditingController _userNameController = TextEditingController();
//   late ImagePicker _imagePicker;
//   late PickedFile _pickedImage;
//   late String _profilePhotoUrl;

//   @override
//   void initState() {
//     super.initState();
//     _imagePicker = ImagePicker();
//     _profilePhotoUrl = ""; // Initialize _profilePhotoUrl
//   }

//   final ImagePicker _picker = ImagePicker();
//   Future<void> _imgFromGallery() async {
//     final pickedImage =
//         // ignore: deprecated_member_use
//         await _imagePicker.getImage(source: ImageSource.gallery);
//     setState(() {
//       _pickedImage = pickedImage!;
//       _profilePhotoUrl = pickedImage
//           .path; // Update _profilePhotoUrl with the selected image path
//     });
//   }

//   Future uploadFile() async {
//     if (_photo == null) return;
//     final fileName = basename(_photo!.path);
//     final destination = 'files/$fileName';

//     try {
//       final ref = firebase_storage.FirebaseStorage.instance
//           .ref(destination)
//           .child('file/');
//       await ref.putFile(_photo!);
//     } catch (e) {
//       print('error occured');
//     }
//   }

// Future<void> saveUserData() async {
//   final firebaseUser = FirebaseAuth.instance.currentUser;
//   final userId = firebaseUser?.uid;
//   print("stored data");

//   final userData = {
//     'username': _userNameController.text,
//     'aboutMe': _aboutMeController.text,
//   };

//   await FirebaseFirestore.instance
//       .collection('users')
//       .doc(userId)
//       .set(userData);
// }

//   final fireStore = FirebaseFirestore.instance.collection("users");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: Icon(Icons.arrow_back)),
//         title: Text("Profile"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("users").snapshots(),
//         builder: (context, snapshot) {
//           return Center(
//             child: Column(
//               children: [
//                 Stack(
//                   alignment: AlignmentDirectional.bottomEnd,
//                   children: [
//                     CircleAvatar(
//                       radius: 55,
//                       backgroundColor: Color(0xffFDCF09),
//                       child: GestureDetector(
//                         onTap: () {
//                           _imgFromGallery();
//                         },
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(50),
//                           child: _profilePhotoUrl.isNotEmpty
//                               ? Image.file(
//                                   File(_profilePhotoUrl),
//                                   width: 100,
//                                   height: 100,
//                                   fit: BoxFit.fitHeight,
//                                 )
//                               : Image.asset(
//                                   "assets/images/pfp.jpg",
//                                   width: 100,
//                                   height: 100,
//                                   fit: BoxFit.fitHeight,
//                                 ),
//                         ),
//                       ),
//                       //  Container(
//                       //     decoration: BoxDecoration(
//                       //         color: Colors.grey[200],
//                       //         borderRadius: BorderRadius.circular(50)),
//                       //     width: 100,
//                       //     height: 100,
//                       //     child: Icon(
//                       //       Icons.camera_alt,
//                       //       color: Colors.grey[800],
//                       //     ),
//                       //   ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 45, right: 45),
//                   child: ListTile(
//                     title: _isEditing
//                         ? Align(
//                             alignment: Alignment.center,
//                             child: TextField(controller: _userNameController))
//                         : Align(
//                             alignment: Alignment.center,
//                             child: Text(_userNameController.text,
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                 )),
//                           ),
//                     // subtitle: _isEditing
//                     //     ? TextField(controller: _userNameController)
//                     //     : Text(_userNameController.text),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (_isEditing) {
//                       String id =
//                           DateTime.now().millisecondsSinceEpoch.toString();
//                       print("data added");
//                       fireStore.doc(id).set({
//                         'about me': _aboutMeController.text.toString(),
//                         'id': id
//                       }).then((value) {});
//                     }
//                     setState(() {
//                       _isEditing = !_isEditing;
//                     });
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 120,
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                             width: 1,
//                             color: Color.fromARGB(255, 159, 125, 255)),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.edit_note,
//                             color: Color.fromARGB(255, 159, 125, 255)),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Text(
//                           _isEditing ? "Save" : "Edit Profile",
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 159, 125, 255)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: ListTile(
//                       title: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'About Me',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ),
//                       subtitle: _isEditing
//                           ? TextField(
//                               controller: _aboutMeController,
//                             )
//                           : Text(_aboutMeController.text)),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//     // ElevatedButton(
//             //     onPressed: () {
//             //       FirebaseAuth.instance.signOut().then((value) {
//             //         print("Signed Out");
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => SignIn()),
// );
// });
//             //     },
//             //     child: Text("Log Out")),
//             // ListTile(
//             //   title: Text("About Me"),
//             //   subtitle: _isEditing
//             //       ? TextField(
//             //           controller: _aboutMeController,
//             //           // Other text field properties...
//             //         )
//             //       : Text(_aboutMeController.text), // Display current value
//             // ),

//             // // Interests section
//             // ListTile(
//             //   title: Text("Interests"),
//             //   subtitle: _isEditing
//             //       ? TextField(
//             //           controller: _interestsController,
//             //           // Other text field properties...
//             //         )
//             //       : Text(_interestsController.text), // Display current value
//             // ),

//             // // Edit profile button
//             // ElevatedButton(
//             //   onPressed: () {
//             //     setState(() {
//             //       _isEditing = !_isEditing; // Toggle editing mode
//             //     });
//             //   },
//             //   child: Text(_isEditing ? "Save" : "Edit Profile"),
//             // ),

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile {
  late final String name;
  late final String bio;

  UserProfile({required this.name, required this.bio});
}

class ProfileController extends GetxController {
  final user = UserProfile(name: "John Doe", bio: "Software Developer").obs;

  void updateProfile(String newName, String newBio) {
    user.update((profile) {
      profile!.name = newName;
      profile.bio = newBio;
    });
  }
}

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text('Name: ${controller.user.value.name}')),
            Obx(() => Text('Bio: ${controller.user.value.bio}')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showEditDialog(context, controller);
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void showEditDialog(BuildContext context, ProfileController controller) {
    TextEditingController nameController =
        TextEditingController(text: controller.user.value.name);
    TextEditingController bioController =
        TextEditingController(text: controller.user.value.bio);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: bioController,
                decoration: InputDecoration(labelText: 'Bio'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.updateProfile(
                  nameController.text,
                  bioController.text,
                );
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

// void main() {
//   runApp(GetMaterialApp(
//     home: ProfilePage(),
//   ));
// }
