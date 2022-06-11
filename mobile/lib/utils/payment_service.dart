import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  static Future createOrder(package, paymentMethod, price, status) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("orders").doc(firebaseUser?.uid).set({
      "package": package,
      "paymentMethod": paymentMethod,
      "price": price,
      "status": status,
    }, SetOptions(merge: true)).then((value) =>
        // ignore: avoid_print
        print("Order Package being processed, please choose payment method"));
  }
}
