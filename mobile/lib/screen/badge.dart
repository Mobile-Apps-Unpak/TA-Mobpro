import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/payment.dart';
import 'package:mobile/utils/payment_service.dart';

class Badge extends StatefulWidget {
  final String? id;
  const Badge(this.id, {Key? key}) : super(key: key);

  @override
  State<Badge> createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  final CollectionReference badge =
      FirebaseFirestore.instance.collection('badge');

  String badgeType = '';
  String price = '';
  String duration = '';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Badge',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: w * .015, vertical: h * .02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: h * 0.15,
                      width: w * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffE2A042),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xff808080),
                        ),
                      ),
                      child: const Text(
                        'Bronze',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Text(
                      '3 Months',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: h * 0.15,
                      width: w * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffDBE4EB),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xff808080),
                        ),
                      ),
                      child: const Text(
                        'Silver',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Text(
                      '6 Months',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: h * 0.15,
                      width: w * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffFFC100),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xff808080),
                        ),
                      ),
                      child: const Text(
                        'Gold',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Text(
                      '12 Months',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: badge.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('Empty Data'),
                  );
                } else {
                  return Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => badgeData(context,
                                badgeType: e['badgeType'],
                                price: e['price'],
                                duration: e['duration']),
                          )
                          .toList());
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget badgeData(BuildContext context,
      {required badgeType, required price, required duration}) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ListTile(
      title: Card(
        child: InkWell(
          onTap: () async {
            PaymentService.createOrder(badgeType, "0", price, "On Process")
                .then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Payment(widget.id, badgeType, price),
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: w * .03),
            height: h * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  badgeType,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
