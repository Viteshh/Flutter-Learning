import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cached_network_image/cached_network_image.dart';

// import '../user_profile/auth_service.dart';
// import '../user_profile/database_service.dart';
// import '../user_profile/user_model.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _aboutMeController = TextEditingController();
//   File? _imageFile;
//   final ImagePicker _imagePicker = ImagePicker();

//   // User? _currentUser;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   Future<void> _fetchUserData() async {
//     try {
//       String? userId = AuthService().getCurrentUserId();
//       if (userId != null) {
//         DocumentSnapshot snapshot = await DatabaseService().getUserData(userId);
//         setState(() {
//           _currentUser = User(
//             userId: snapshot.id,
//             username: snapshot.get('username') ?? '',
//             profilePhoto: snapshot.get('profilePhoto') ?? '',
//             aboutMe: snapshot.get('aboutMe') ?? '',
//           );
//           _usernameController.text = _currentUser!.username;
//           _aboutMeController.text = _currentUser!.aboutMe;
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: () {
//                 _pickImage(ImageSource.gallery);
//               },
//               child: CircleAvatar(
//                 radius: 50.0,
//                 backgroundImage: _currentUser!.profilePhoto.isNotEmpty
//                     ? CachedNetworkImageProvider(_currentUser!.profilePhoto)
//                     : null,
//                 child: _currentUser!.profilePhoto.isNotEmpty
//                     ? null
//                     : Icon(
//                         Icons.camera_alt,
//                         size: 50.0,
//                       ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _usernameController,
//               decoration: InputDecoration(
//                 labelText: 'Username',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _aboutMeController,
//               decoration: InputDecoration(
//                 labelText: 'About Me',
//               ),
//               maxLines: 3,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 _updateProfile();
//               },
//               child: Text('Update Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _imagePicker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _updateProfile() async {
//     try {
//       String? userId = AuthService().getCurrentUserId();
//       final username = _usernameController.text.trim();
//       final aboutMe = _aboutMeController.text.trim();

//       String? profilePhotoUrl;

//       // Upload profile photo if changed
//       if (_imageFile != null) {
//         profilePhotoUrl = await _uploadProfilePhoto(userId!, _imageFile!);
//       }

//       // Update user data in Firestore
//       await DatabaseService().updateUserData(userId!, username,
//           profilePhotoUrl ?? _currentUser!.profilePhoto, aboutMe);

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Profile updated successfully!'),
//       ));
//     } catch (e) {
//       print(e.toString());
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to update profile. Please try again.'),
//       ));
//     }
//   }

//   Future<String> _uploadProfilePhoto(String userId, File imageFile) async {
//     try {
//       firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child('profile_photos/$userId.jpg');
//       firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
//       firebase_storage.TaskSnapshot taskSnapshot =
//           await uploadTask.whenComplete(() => null);
//       String downloadUrl = await taskSnapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print(e.toString());
//       throw Exception(e);
//     }
//   }
// }

List<String> customerReviews = [
  "Review 1",
  "Review 2",
  "Review 3",
];

class CustomerReviewsPage extends StatefulWidget {
  @override
  _CustomerReviewsPageState createState() => _CustomerReviewsPageState();
}

class _CustomerReviewsPageState extends State<CustomerReviewsPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: customerReviews.length,
              controller: PageController(initialPage: currentIndex),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      customerReviews[index],
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (currentIndex < customerReviews.length - 1) {
                  currentIndex++;
                } else {
                  currentIndex = 0;
                }
              });
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
