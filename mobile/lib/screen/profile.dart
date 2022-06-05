import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffd44c),
      body: ListView(
        children: [
          Image.asset('assets/study.png'),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 80,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {},
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'test@gmail.com',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 2,
                        color: const Color(0xffFCA02B),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Fullname',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'peron1',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 2,
                        color: const Color(0xffFCA02B),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'address',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'jalan kenangan no 1',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 2,
                        color: const Color(0xffFCA02B),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'School',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'SMA 2',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 2,
                        color: const Color(0xffFCA02B),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Package',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'Gold',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 2,
                        color: const Color(0xffFCA02B),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        '0652121453',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 2,
                        color: const Color(0xffFCA02B),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
