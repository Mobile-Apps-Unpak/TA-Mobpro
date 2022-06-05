import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  color: Color(0xffffd44c),
                  child: Center(
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
              child: Container(
                //color: Colors.blue,
                child: ListView(children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          //color: Colors.red,
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 0.5)),
                        ),
                        //padding: EdgeInsets.only(bottom: 3),
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        //color: Colors.red,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon1_payment.png",
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Bank Transfer",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/bca_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Bank Transfer",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/mandiri_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Bank Mandiri",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/bni_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Bank BNI",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/bri_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Bank BRI",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/cimb_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Bank Cimn Niaga",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          //color: Colors.red,
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 0.5)),
                        ),
                        //padding: EdgeInsets.only(bottom: 3),
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        //color: Colors.red,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon2_payment.png",
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "E-Money",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/dana_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Dana",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/gopay_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Gopay",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/ovo_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "OVO",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/shopeepay_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Shopee pay",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/linkaja_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Bank LinkAja",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          //color: Colors.red,
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 0.5)),
                        ),
                        //padding: EdgeInsets.only(bottom: 3),
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        //color: Colors.red,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon3_payment.png",
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Other Payment",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/alfamart_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Alfamart / Alfamidi",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                //color: Colors.red,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/indomaret_payment.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Indomaret / i.Saku",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
              )),
        ],
      ),
    );
  }
}
