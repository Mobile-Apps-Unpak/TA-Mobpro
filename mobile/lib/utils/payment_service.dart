// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  static Future createOrder(id, badge, paymentMethod, price) async {
    await FirebaseFirestore.instance.collection("orders").doc(id).set({
      "badge": badge,
      "paymentMethod": paymentMethod,
      "price": price,
      "status": "On Progress"
    }, SetOptions(merge: true)).then((value) => print("Order Created"));
  }

  static Future updateOrder(id) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(id)
        .update({"status": "Paid"}).then((_) {
      print("Order Updated!");
    });
  }

  static Future deleteOrder(id) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(id)
        .delete()
        .then((_) {
      print("Delete Order success!");
    });
  }
}
