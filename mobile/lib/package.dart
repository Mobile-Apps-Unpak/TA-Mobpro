import 'package:flutter/material.dart';

class Package extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            color: const Color(0xffFFD44C),
            height: MediaQuery.of(context).size.height * 0.20,
            child: const Text(
              'Package',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
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
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
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
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
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
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height * 0.1,
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
                            'Rp 500.000',
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
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height * 0.1,
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
                            'Rp 500.000',
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
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height * 0.1,
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
                            'Rp 500.000',
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
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 150),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Proceed to Payment',
                style: TextStyle(color: Colors.black87),
              ),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xffFFD44C),
                  fixedSize: const Size(10, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
        ],
      ),
    );
  }
}
