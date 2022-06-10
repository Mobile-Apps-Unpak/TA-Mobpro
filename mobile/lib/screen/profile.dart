import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  final String? id;
  const Profile(this.id, {Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  late String email;
  late String name;
  late String phone;
  late String school;

  @override
  void initState() {
    users
        .doc(widget.id)
        .snapshots()
        .listen((DocumentSnapshot<Object?> snapshot) {
      email = snapshot.get('email').toString();
      name = snapshot.get('name').toString();
      phone = snapshot.get('phone').toString();
      school = snapshot.get('school').toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: getUser(),
    );
  }

  FutureBuilder<DocumentSnapshot<Object?>> getUser() {
    return FutureBuilder(
      future: users.doc(widget.id).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        try {
          if (snapshot.hasData) {
            return userProfile(context);
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget userProfile(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .7,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Email
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: h * .015,
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: h * .04,
                    ),
                    //Fullname
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: h * .015,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: h * .04,
                    ),
                    //School
                    const Text(
                      'School',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: h * .015,
                    ),
                    Text(
                      school,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: h * .04,
                    ),
                    //Phone
                    const Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: h * .015,
                    ),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: h * .04,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
