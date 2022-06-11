import 'package:flutter/material.dart';
import 'package:mobile/utils/payment_service.dart';
import 'package:mobile/utils/userdata.dart';

class Checkout extends StatelessWidget {
  final String? id;
  final String? badgeType;
  final String? price;
  const Checkout(this.id, this.badgeType, this.price, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

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
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: Text(badgeType!),
                          ),
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
                              price!,
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
                  Container(
                    width: w * .79,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
                            border: Border.all(color: Colors.black, width: 1),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Total Payment',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      price!,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        TextButton(
                            onPressed: (() {
                              UserData.updateBadge(id, badgeType);
                              PaymentService.createOrder(
                                      badgeType, " ", price, "Paid")
                                  .then((value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Order success'),
                                        ),
                                      ));
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
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Make an Order',
                                  style: TextStyle(color: Colors.white),
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
}
