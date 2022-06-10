import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressUser {
  static Future inputProgress(id, progress) async {
    FirebaseFirestore.instance.collection("users").doc(id).set({
      "currentProgress": progress,
    }, SetOptions(merge: true)).then((_) {
      // ignore: avoid_print
      print("success!");
    });
  }
}
