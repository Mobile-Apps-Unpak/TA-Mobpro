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

  String email = '';
  String name = '';
  String phone = '';
  String school = '';
  String badge = '';

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
      badge = snapshot.get('badge').toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
      ),
      body: getUser(),
    );
  }

  FutureBuilder<DocumentSnapshot<Object?>> getUser() {
    return FutureBuilder(
      future: users.doc().get(),
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
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            ItemList(
                              tittle: 'email',
                              value: email,
                              icons: Icons.email,
                            ),
                            Box(h: h),
                            ItemList(
                              tittle: 'Full Name',
                              value: name,
                              icons: Icons.person,
                            ),
                            Box(h: h),
                            ItemList(
                              tittle: 'School',
                              value: school,
                              icons: Icons.school,
                            ),
                            Box(h: h),
                            ItemList(
                              tittle: 'Phone',
                              value: phone,
                              icons: Icons.phone,
                            ),
                            Box(h: h),
                            ItemList(
                              tittle: 'Badge',
                              value: badge,
                              icons: Icons.badge_outlined,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    Key? key,
    required this.h,
  }) : super(key: key);

  final double h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * .015,
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.icons,
    required this.tittle,
    required this.value,
  }) : super(key: key);

  final IconData icons;
  final String tittle;
  final String value;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * .020, vertical: h * .010),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icons,
            size: 30,
          ),
          SizedBox(width: w * .050),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tittle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: h * .005,
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
