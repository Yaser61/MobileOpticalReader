import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection('user');
  final firebaseAuth = FirebaseAuth.instance;

  Future<bool> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final userCredential =
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> sigIn({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        debugPrint('başarılı giriş');
        debugPrint(userCredential.user!.email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      debugPrint('başarısız');
    }
    return false;
  }

  Future<void> saveUserInfoToFirebase(UserModel userModel) async {
    userModel.userID = firebaseAuth.currentUser!.uid;
    await userCollection
        .doc(firebaseAuth.currentUser!.uid)
        .set(userModel.toMap());

    debugPrint('userID: ${userModel.userID}');
  }

  Future<void> signOut() async {
    debugPrint("çıkış yapıldı...");
    await firebaseAuth.signOut();
  }
}