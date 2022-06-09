// ignore_for_file: avoid_print

import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  static get db => null;

  static Future<Void> signOut() async {
    _auth.signOut();

    return signOut();
  }

  static Future signIn(emailAddress, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        print('Password salah');
      }
    }
  }

  static Future createUser(emailAddress, password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }

  static Future updatePassword(newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
    } catch (e) {
      print(e);
    }
  }
}
