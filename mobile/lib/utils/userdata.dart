// ignore_for_file: avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static Future inputData(email, name, phone, school) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users").doc(firebaseUser?.uid).set({
      "email": email,
      "name": name,
      "phone": phone,
      "school": school,
    }, SetOptions(merge: true)).then((_) {
      // ignore: avoid_print
      print("success!");
    });
  }

  static Future deleteData() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser?.uid)
        .delete()
        .then((_) {
      print("success!");
    });
  }

  static Future updateData(name, phone, school) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser?.uid)
        .update({"name": name, "phone": phone, "school": school}).then((_) {
      print("success!");
    });
  }
}
