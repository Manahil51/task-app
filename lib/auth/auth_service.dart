import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  //Sign user in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      //sign in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      print("User signed in: ${userCredential.user!.uid}");
      await
          // add a new document for the users collection if it  doesn't already exists
          _fireStore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Sign-in error: ${e.code}");
      throw Exception(e.code); // Throw an exception with the error code
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print("User signed up: ${userCredential.user!.uid}");
      await _fireStore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Sign-up error: ${e.code}");
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth
        .signOut(); // Use the instance variable `_firebaseAuth` to sign out
    print("User signed out");
  }
}
