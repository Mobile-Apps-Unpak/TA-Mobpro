import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/edit_profile.dart';
import 'package:mobile/utils/userdata.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: const Color(0xffffd44c),
      body: ListView(
        children: [
          Image.asset('assets/study.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height * .07,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
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
                        Text(
                          user.email!,
                          style: const TextStyle(
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
                          'Full Name',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'name',
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
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.amber),
                                    onPressed: () =>
                                        FirebaseAuth.instance.signOut(),
                                    child: const Text(
                                      'Logout',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Align(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    onPressed: () async {
                                      await UserData.deleteData();
                                      FirebaseAuth.instance.currentUser
                                          ?.delete();
                                    },
                                    child: const Text(
                                      'Delete Account',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.amber),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => const EditProfile(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
