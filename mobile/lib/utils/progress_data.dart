// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProgressData {
  static Future inputProgress(index, title, count) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("study_progress")
        .doc(firebaseUser?.uid)
        .set({
      "index": index,
      "title": title,
      "count": count,
    }, SetOptions(merge: true)).then((_) {
      print("Input Progress success!");
    });
  }

  static Future updateProgress(id, index, title, count) async {
    FirebaseFirestore.instance
        .collection("study_progress")
        .doc(id)
        .update({"index": index, "title": title, "count": count}).then((_) {
      print("Update Progress success!");
    });
  }

  Future countModul() async {
    var respectsQuery = FirebaseFirestore.instance.collection('modul');
    var querySnapshot = await respectsQuery.get();
    var totalCounts = querySnapshot.docs.length;
    return totalCounts;
  }
}
