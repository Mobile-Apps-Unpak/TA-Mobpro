import 'package:flutter/material.dart';
import 'package:mobile/screen/checkout.dart';
import 'package:mobile/utils/payment_service.dart';

class Payment extends StatelessWidget {
  const Payment(this.id, this.badgeType, this.price, {Key? key})
      : super(key: key);
  final String? id;
  final String? badgeType;
  final String? price;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: const Text(
          'Payment Method',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      margin: EdgeInsets.only(
                        left: w * .05,
                      ),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                              PaymentService.updateOrder(
                                  id, badgeType, "Indomaret", price, "ready");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      Checkout(id, badgeType, price),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                                PaymentService.updateOrder(
                                    id, badgeType, "Indomaret", price, "ready");
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        Checkout(id, badgeType, price),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
                                  PaymentService.updateOrder(id, badgeType,
                                      "Indomaret", price, "ready");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          Checkout(id, badgeType, price),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
