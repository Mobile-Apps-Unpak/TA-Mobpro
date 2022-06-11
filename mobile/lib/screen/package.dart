import 'package:flutter/material.dart';
import 'package:mobile/screen/payment.dart';
import 'package:mobile/utils/payment_service.dart';

class Package extends StatelessWidget {
  const Package({Key? key}) : super(key: key);

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
          'Package',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .02),
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
                    )
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
                    )
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
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .02),
            padding: EdgeInsets.symmetric(horizontal: w * .01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Package : ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Center(
                            child: Text('Order Package Confirmation'),
                          ),
                          content:
                              const Text('Are You Sure Buy Bronze Package?'),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await PaymentService.createOrder(
                                          "bronze", null, "100000", "process")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please choose payment method'),
                                      ),
                                    ),
                                  );
                                  PaymentService.createOrder(
                                      "bronze", null, "100000", "process");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Payment(),
                                    ),
                                  );
                                },
                                child: const Text('Yes')),
                            TextButton(
                                onPressed: () => Navigator.pop(context, "No"),
                                child: const Text('No')),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: w * .03),
                      height: h * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Bronze',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Rp 100.000',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Center(
                            child: Text('Order Package Confirmation'),
                          ),
                          content:
                              const Text('Are You Sure Buy Silver Package?'),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await PaymentService.createOrder(
                                          "silver", null, "180000", "process")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please choose payment method'),
                                      ),
                                    ),
                                  );
                                  PaymentService.createOrder(
                                      "silver", null, "180000", "process");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Payment(),
                                    ),
                                  );
                                },
                                child: const Text('Yes')),
                            TextButton(
                                onPressed: () => Navigator.pop(context, "No"),
                                child: const Text('No')),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: w * .03),
                      height: h * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Silver',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Rp 180.000',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Center(
                            child: Text('Order Package Confirmation'),
                          ),
                          content: const Text('Are You Sure Buy Gold Package?'),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await PaymentService.createOrder(
                                          "gold", null, "260000", "process")
                                      .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please choose payment method'),
                                      ),
                                    ),
                                  );
                                  PaymentService.createOrder(
                                      "gold", null, "260000", "process");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const Payment(),
                                    ),
                                  );
                                },
                                child: const Text('Yes')),
                            TextButton(
                                onPressed: () => Navigator.pop(context, "No"),
                                child: const Text('No')),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: w * .03),
                      height: h * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Gold',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Rp 260.000',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
