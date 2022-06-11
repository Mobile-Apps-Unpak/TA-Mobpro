import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/checkout.dart';
import 'package:mobile/utils/payment_service.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  @override
  Widget build(BuildContext context) {
    return getOrder();
  }

  FutureBuilder<DocumentSnapshot<Object?>> getOrder() {
    return FutureBuilder(
      future: orders.doc(firebaseUser?.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        try {
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            var package = data['package'];
            var price = data['price'];
            return getPayment(context, package, price);
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget getPayment(BuildContext context, package, price) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  color: const Color(0xffffd44c),
                  child: const Center(
                    child: Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ))),
          Expanded(
              flex: 8,
              child: ListView(children: [
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        //color: Colors.red,
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      //padding: EdgeInsets.only(bottom: 3),
                      margin: EdgeInsets.only(
                        left: w * .05,
                      ),
                      //color: Colors.red,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon1_payment.png",
                            width: w * .1,
                            height: h * .06,
                          ),
                          SizedBox(
                            width: w * .05,
                          ),
                          const Text(
                            "Bank Transfer",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Bank BCA", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/bca_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Bank BCA",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(package,
                                          "Bank mandiri", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/mandiri_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Bank Mandiri",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Bank BNI", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/bni_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Bank BNI",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Bank BRI", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/bri_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Bank BRI",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          InkWell(
                            onTap: () {
                              PaymentService.createOrder(package,
                                      "Bank CIMB niaga", price, "ready")
                                  .then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please purchase your order'),
                                  ),
                                ),
                              );
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const Checkout(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/cimb_payment.png",
                                  width: w * .1,
                                  height: h * .06,
                                ),
                                SizedBox(
                                  width: w * .05,
                                ),
                                const Text(
                                  "Bank Cimn Niaga",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        //color: Colors.red,
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      //padding: EdgeInsets.only(bottom: 3),
                      margin: EdgeInsets.only(
                        left: w * .05,
                      ),
                      //color: Colors.red,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon2_payment.png",
                            width: w * .1,
                            height: h * .06,
                          ),
                          SizedBox(
                            width: w * .05,
                          ),
                          const Text(
                            "E-Money",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Dana", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/dana_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Dana",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Gopay", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/gopay_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Gopay",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                            decoration: const BoxDecoration(
                              //color: Colors.red,
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)),
                            ),
                            child: InkWell(
                              onTap: () {
                                PaymentService.createOrder(
                                        package, "Ovo", price, "ready")
                                    .then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Please purchase your order'),
                                    ),
                                  ),
                                );
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const Checkout(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/ovo_payment.png",
                                    width: w * .1,
                                    height: h * .06,
                                  ),
                                  SizedBox(
                                    width: w * .05,
                                  ),
                                  const Text(
                                    "OVO",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Shoppe Pay", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/shopeepay_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Shopee pay",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Linkaja", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/linkaja_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Bank LinkAja",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        //color: Colors.red,
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),

                      margin: EdgeInsets.only(
                        left: w * .05,
                      ),
                      //color: Colors.red,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon3_payment.png",
                            width: w * .1,
                            height: h * .06,
                          ),
                          SizedBox(
                            width: w * .05,
                          ),
                          const Text(
                            "Other Payment",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Alfamart", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/alfamart_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Alfamart / Alfamidi",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.createOrder(
                                          package, "Indomaret", price, "ready")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please purchase your order'),
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Checkout(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/indomaret_payment.png",
                                      width: w * .1,
                                      height: h * .06,
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    const Text(
                                      "Indomaret / i.Saku",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ])),
        ],
      ),
    );
  }
}
