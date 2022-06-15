import 'package:flutter/material.dart';
import 'package:mobile/screen/checkout.dart';
import 'package:mobile/utils/payment_service.dart';
import 'package:mobile/widget/appbar_without_leading.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod(this.id, this.badgeType, this.price, {Key? key})
      : super(key: key);

  final String? id;
  final String badgeType;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutLeading(context, 'Payment Method'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Method(
                    title: 'Bank Transfer',
                  ),
                  ListItem(
                    listname: 'Bank BCA',
                    listicon: const Icon(Icons.account_balance_wallet_rounded),
                    badgeType: badgeType,
                    price: price,
                    id: id,
                  ),
                  const Garis(),
                  ListItem(
                    listname: 'Bank BNI',
                    listicon: const Icon(Icons.account_balance_wallet_rounded),
                    badgeType: badgeType,
                    price: price,
                    id: id,
                  ),
                  const Garis(),
                  ListItem(
                    listname: 'Bank BRI',
                    listicon: const Icon(Icons.account_balance_wallet_rounded),
                    badgeType: badgeType,
                    price: price,
                    id: id,
                  ),
                  const Garis(),
                  ListItem(
                    listname: 'Bank Mandiri',
                    listicon: const Icon(Icons.account_balance_wallet_rounded),
                    badgeType: badgeType,
                    price: price,
                    id: id,
                  ),
                  const Garis(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Method(
                    title: 'E-Wallet',
                  ),
                  ListItem(
                    listname: 'Gopay',
                    listicon: const Icon(Icons.wallet),
                    badgeType: badgeType,
                    price: price,
                    id: id,
                  ),
                  const Garis(),
                  ListItem(
                    listname: 'Dana',
                    listicon: const Icon(Icons.wallet),
                    badgeType: badgeType,
                    price: price,
                    id: id,
                  ),
                  const Garis(),
                  ListItem(
                    listname: 'OwO',
                    listicon: const Icon(Icons.wallet),
                    badgeType: badgeType,
                    price: price,
                    id: id,
                  ),
                  const Garis(),
                ],
              ),
            ),
          ],
        ),
      ),
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
      margin: const EdgeInsets.only(left: 15),
      height: 1,
      color: Colors.grey[200],
    );
  }
}

class Method extends StatelessWidget {
  const Method({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String? id;
  final String badgeType;
  final String price;

  const ListItem({
    required this.id,
    required this.badgeType,
    required this.price,
    Key? key,
    required this.listname,
    required this.listicon,
  }) : super(key: key);

  final String listname;
  final Icon listicon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(listname),
      leading: listicon,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
      onTap: () {
        PaymentService.createOrder(id, badgeType, listname, price);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => Checkout(id, badgeType, listname, price),
          ),
        );
      },
    );
  }
}
