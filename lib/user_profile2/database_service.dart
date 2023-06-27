import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  // Add user data to Firestore
  Future<void> addUserData(String userId, String username, String profilePhoto,
      String aboutMe) async {
    try {
      await _usersCollection.doc(userId).set({
        'username': username,
        'profilePhoto': profilePhoto,
        'aboutMe': aboutMe,
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  // Update user data in Firestore
  Future<void> updateUserData(String userId, String username,
      String profilePhoto, String aboutMe) async {
    try {
      await _usersCollection.doc(userId).update({
        'username': username,
        'profilePhoto': profilePhoto,
        'aboutMe': aboutMe,
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  // Retrieve user data from Firestore
  Future<DocumentSnapshot> getUserData(String userId) async {
    try {
      DocumentSnapshot snapshot = await _usersCollection.doc(userId).get();
      return snapshot;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}
