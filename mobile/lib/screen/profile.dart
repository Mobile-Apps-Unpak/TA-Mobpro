import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffd44c),
      body: ListView(
        children: [
          Image.asset('assets/logo_app.png'),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: const Radius.circular(60),
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
                      child: const Icon(
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
                            onPressed: () {},
                            child: const Text('Edit Profile'),
                          )),
                    ],
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'test@gamil.com',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 2,
                          color: Color(0xffFCA02B),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Fullname',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'peron1',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 2,
                          color: Color(0xffFCA02B),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'address',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'jalan kenangan no 1',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 2,
                          color: Color(0xffFCA02B),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'School',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'SMA 2',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 2,
                          color: Color(0xffFCA02B),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Package',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'Gold',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 2,
                          color: Color(0xffFCA02B),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Phone',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          '0652121453',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 2,
                          color: Color(0xffFCA02B),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
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
