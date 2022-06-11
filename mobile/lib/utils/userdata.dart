// ignore_for_file: avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static Future inputData(email, name, phone, school, badge) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users").doc(firebaseUser?.uid).set({
      "email": email,
      "name": name,
      "phone": phone,
      "school": school,
      "badge": badge,
    }, SetOptions(merge: true)).then((_) {
      // ignore: avoid_print
      print("success!");
    });
  }

  static Future deleteData(id) async {
    FirebaseFirestore.instance.collection("users").doc(id).delete().then((_) {
      print("success!");
    });
  }

  static Future updateData(id, name, phone, school) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"name": name, "phone": phone, "school": school}).then((_) {
      print("success!");
    });
  }

  static Future updateBadge(id, badge) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"badge": badge}).then((_) {
      print("success!");
    });
  }
}
