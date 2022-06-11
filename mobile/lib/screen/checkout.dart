import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/payment.dart';
import 'package:mobile/utils/payment_service.dart';
import 'package:mobile/utils/userdata.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(firebaseUser?.uid).get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> snapshotUser) {
          return FutureBuilder<DocumentSnapshot>(
            future: orders.doc(firebaseUser?.uid).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                Map<String, dynamic> dataUser =
                    snapshotUser.data!.data() as Map<String, dynamic>;
                var email = dataUser['email'];
                var name = dataUser['name'];
                var phone = dataUser['phone'];
                var school = dataUser['school'];
                var bandage = data['package'];
                var package = data['package'];
                var price = data['price'];
                var paymentMethod = data['paymentMethod'];
                var color = 0;
                if (data['package'] == 'bronze') {
                  color = 0xFFCD7F32;
                } else if (data['package'] == 'silver') {
                  color = 0xFFC0C0C0;
                } else {
                  color = 0xFFD4AF37;
                }

                return Scaffold(
                  backgroundColor: const Color(0xffffd44c),
                  body: ListView(
                    children: [
                      Container(
                        color: const Color(0xffffd44c),
                        height: h * 0.09,
                        child: const Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Container(
                                      height: h * 0.12,
                                      width: w * 0.24,
                                      decoration: BoxDecoration(
                                        color: Color(color),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                      ),
                                      child: Center(
                                          child: Text("${data['package']}")),
                                    ),
                                    SizedBox(
                                      width: w * .05,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Payment',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${data['price']}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h * .01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Metode Pembayaran',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => const Payment(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Pilih Metode',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * .02,
                              ),
                              Center(child: Image.asset('assets/logo_all.png')),
                              SizedBox(
                                height: h * .02,
                              ),
                              Center(
                                  child: Image.asset('assets/logo_all2.png')),
                              SizedBox(
                                height: h * .04,
                              ),
                              Container(
                                width: w * .79,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerRight,
                                      height: h * .1,
                                      width: w * .5,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'Total Pembayaran',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  "${data['price']}",
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    TextButton(
                                        onPressed: (() {
                                          UserData.inputData(email, name, phone,
                                              school, bandage);
                                          PaymentService.createOrder(package,
                                                  paymentMethod, price, "paid")
                                              .then(
                                            (value) =>
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('ordered success'),
                                              ),
                                            ),
                                          );
                                        }),
                                        child: Center(
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: h * .1,
                                            width: w * .22,
                                            decoration: const BoxDecoration(
                                              color: Color(0xffFCA02B),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                            ),
                                            child: const Text(
                                              'Buat Pesanan',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(height: h * .05),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const Text("loading");
            },
          );
        });
  }
}
