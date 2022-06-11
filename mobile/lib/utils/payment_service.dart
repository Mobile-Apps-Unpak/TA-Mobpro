// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  static Future createOrder(package, paymentMethod, price, status) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("orders").doc(firebaseUser?.uid).set({
      "badge": package,
      "paymentMethod": paymentMethod,
      "price": price,
      "status": status,
    }, SetOptions(merge: true)).then((value) => print("Order Created"));
  }

  static Future updateOrder(id, badge, paymentMethod, price, status) async {
    FirebaseFirestore.instance.collection("orders").doc(id).update({
      "badge": badge,
      "paymentMethod": paymentMethod,
      "price": price,
      "status": status,
    }).then((_) {
      print("Order Updated!");
    });
  }
}
