import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/userdata.dart';

class Profile extends StatefulWidget {
  final String? id;
  const Profile(this.id, {Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final CollectionReference userdata =
      FirebaseFirestore.instance.collection('users');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();

  @override
  void initState() {
    userdata
        .doc(widget.id)
        .snapshots()
        .listen((DocumentSnapshot<Object?> snapshot) {
      _emailController.text = snapshot.get('email').toString();
      _nameController.text = snapshot.get('name').toString();
      _phoneController.text = snapshot.get('phone').toString();
      _schoolController.text = snapshot.get('school').toString();
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              child: getUser(),
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder<DocumentSnapshot<Object?>> getUser() {
    return FutureBuilder(
      future: userdata.doc(widget.id).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        try {
          if (snapshot.hasData) {
            return dataUser(context);
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget dataUser(BuildContext context) {
    return Form(
      key: _formKey,
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
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  //Validasi TextFormField
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email ca\'nt be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                  //Validasi TextFormField
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name ca\'nt be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _schoolController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'School'),
                  //Validasi TextFormField
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'school ca\'nt be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Number Phone'),
                  //Validasi TextFormField
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[0-9]').hasMatch(value)) {
                      return 'Number Phone ca\'nt be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () => FirebaseAuth.instance.signOut(),
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
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Center(
                                child: Text('Delete User Confirmation'),
                              ),
                              content: const Text('Are You Sure?'),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      await UserData.deleteData().then(
                                        (value) => ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Data User Berhasil Dihapus'),
                                          ),
                                        ),
                                      );
                                      FirebaseAuth.instance.currentUser
                                          ?.delete();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Yes')),
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, "No"),
                                    child: const Text('No')),
                              ],
                            ),
                          );
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
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              UserData.updateData(
                                      _nameController.text.trim(),
                                      _phoneController.text.trim(),
                                      _schoolController.text.trim())
                                  .then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Data User Berhasil Diperbarui'),
                                  ),
                                ),
                              );
                            });
                          }
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
      ),
    );
  }
}
