import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/user_profile/profile_detail.dart';
import 'package:first_app/user_profile/sign_in_page.dart';
import 'package:first_app/user_profile/user_interest.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:first_app/user_profile/edit_profile.dart';

class SaveProfile extends StatefulWidget {
  // const SaveProfile({super.key});

  final String uid;

  SaveProfile({
    required this.uid,
  });

  @override
  State<SaveProfile> createState() => _SaveProfileState();
}

class _SaveProfileState extends State<SaveProfile> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late Stream<DocumentSnapshot> userProfileStream = Stream.empty();

  late DocumentSnapshot? userProfileSnapshot;

  @override
  void initState() {
    super.initState();

    userProfileStream = userProfileStream = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .snapshots();
  }

  // void getUserProfile() async {
  //   DocumentSnapshot snapshot = await users.doc(widget.userId).get();

  //   if (snapshot.exists) {
  //     setState(() {
  //       userProfileSnapshot = snapshot;
  //     });
  //   } else {
  //     print('User profile not found');
  //   }
  // }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    print("Signed Out");
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Profile"),
      ),
      // ...
      body: Center(
        child: Column(
          children: [
            // ...
            StreamBuilder<DocumentSnapshot>(
              stream: userProfileStream,
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasData && snapshot.data!.exists) {
                  final userData =
                      snapshot.data!.data() as Map<String, dynamic>;
                  final fullName = userData['username'] as String;
                  final aboutMe = userData['aboutMe'] as String;
                  final profilePhotoUrl = userData['profilePhotoUrl'] as String;
                  final hobbiesList =
                      List<String>.from(userData['hobbies'] ?? []);
                  print("userData $userData");

                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        // ...
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: profilePhotoUrl.isNotEmpty
                              ? Image.network(
                                  profilePhotoUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                )
                              : Image.asset(
                                  "assets/images/pfp.jpg",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                        ),
                        SizedBox(height: 10),
                        Text(fullName,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: logOut,
                              child: Text("Log Out"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile(
                                            uid: widget.uid,
                                            fullName: fullName,
                                            aboutMe: aboutMe,
                                            profilePhotoUrl: profilePhotoUrl,
                                          )),
                                );
                              },
                              child: Text("Edit"),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('About Me',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Text(aboutMe),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Interest',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            ElevatedButton(
                              child: Text('Change'),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BottomSheetWidget();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final hobby in hobbiesList)
                              Chip(
                                label: Text(
                                  hobby,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                              ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ],
                    ),
                  );
                }

                return Column(
                  children: [
                    Text('No user data available'),
                    ElevatedButton(
                      onPressed: logOut,
                      child: Text("Log Out"),
                    ),
                  ],
                );
              },
            ),
            // ...
          ],
        ),
      ),
    );
  }
}
