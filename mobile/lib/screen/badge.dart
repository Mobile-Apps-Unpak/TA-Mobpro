import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/payment_method.dart';
import 'package:mobile/widget/appbar_without_leading.dart';

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

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBarWithoutLeading(context, 'Badge'),
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
                          color: Theme.of(context).primaryColor,
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
                          color: Theme.of(context).primaryColor,
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
                          color: Theme.of(context).primaryColor,
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
                            (e) => badgeData(
                              context,
                              badgeType: e['badgeType'],
                              price: e['price'],
                            ),
                          )
                          .toList());
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget badgeData(BuildContext context, {required badgeType, required price}) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ListTile(
      title: Card(
        child: InkWell(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PaymentMethod(widget.id, badgeType, price),
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
