import 'package:flutter/material.dart';
import 'package:mobile/utils/payment_service.dart';
import 'package:mobile/utils/userdata.dart';

import '../widget/appbar_without_leading.dart';

class Checkout extends StatelessWidget {
  final String? id;
  final String badgeType;
  final String price;
  final String paymentMethod;
  const Checkout(this.id, this.badgeType, this.paymentMethod, this.price,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutLeading(context, 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Payment Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ItemPurchase(
                      tittle: 'Item :',
                      detail: badgeType,
                      paymentMethod: paymentMethod),
                  const Garis(),
                  const SizedBox(
                    height: 20,
                  ),
                  ItemPurchase(
                      tittle: 'Total Cost :',
                      detail: price,
                      paymentMethod: paymentMethod),
                  const Garis(),
                  const SizedBox(
                    height: 20,
                  ),
                  ItemPurchase(
                      tittle: 'Payment Method :',
                      detail: paymentMethod,
                      paymentMethod: paymentMethod),
                  const Garis(),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        UserData.updateBadge(id, badgeType);
                        PaymentService.updateOrder(id).then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order success'),
                            ),
                          ),
                        );
                      },
                      child: const Text('Purchase'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 212, 76),
                        fixedSize: const Size(300, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemPurchase extends StatelessWidget {
  const ItemPurchase({
    Key? key,
    required this.detail,
    required this.tittle,
    required this.paymentMethod,
  }) : super(key: key);

  final String tittle;
  final String detail;
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tittle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          detail,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class Garis extends StatelessWidget {
  const Garis({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey[200],
    );
  }
}
