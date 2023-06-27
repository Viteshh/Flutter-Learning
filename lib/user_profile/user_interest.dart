import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/user_profile/save_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  User? user = FirebaseAuth.instance.currentUser;
  List<String> selectedHobbies = [];
  List<String> allHobbies = [
    'Drawing',
    'Singing',
    'Dancing',
    'Writing',
    'Online Games',
    'Movies',
    'Music',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Select Hobbies',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: allHobbies.length,
              itemBuilder: (context, index) {
                final hobby = allHobbies[index];
                final isSelected = selectedHobbies.contains(hobby);

                return ListTile(
                  title: Text(hobby),
                  trailing: Icon(
                    isSelected
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: isSelected ? Colors.blue : null,
                  ),
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedHobbies.remove(hobby);
                      } else {
                        selectedHobbies.add(hobby);
                      }
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () {
              // Save the selected hobbies to Firebase
              saveHobbiesToFirebase(selectedHobbies, user!.uid);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void saveHobbiesToFirebase(List<String> hobbies, String uid) {
    final hobbiesRef = FirebaseFirestore.instance.collection('users');
    // late User? user;
    print("save hobby: $selectedHobbies");

    hobbiesRef.doc(uid).update({
      'hobbies': hobbies,
    }).then((value) {
      // Success
    }).catchError((error) {
      // Handle error
    });
  }
}
