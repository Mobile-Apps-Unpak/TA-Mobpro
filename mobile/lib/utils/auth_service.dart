// ignore_for_file: avoid_print

import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<Void> signOut() async {
    _auth.signOut();

    return signOut();
  }

  static Future signIn(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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
      await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }

  static Future updatePassword(newPassword) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
    } catch (e) {
      print(e);
    }
  }

  static Future deleteUser(id, email, password) async {
    try {
      AuthCredential authCredential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(authCredential);
      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      print(e);
    }
  }
}
