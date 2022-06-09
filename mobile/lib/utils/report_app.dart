// ignore_for_file: avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReportApp {
  static Future inputReport(message) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("report").doc().set({
      "email": firebaseUser?.email,
      "uid": firebaseUser?.uid,
      "message": message,
    }, SetOptions(merge: true)).then((_) {
      // ignore: avoid_print
      print("Report Success!");
    });
  }
}
