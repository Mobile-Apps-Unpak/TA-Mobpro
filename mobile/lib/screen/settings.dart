import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/app_info.dart';
import 'package:mobile/screen/change_password.dart';
import 'package:mobile/screen/contact_us.dart';
import 'package:mobile/screen/edit_profile.dart';
import 'package:mobile/utils/userdata.dart';
import 'dart:io';

class Settings extends StatefulWidget {
  final String? id;
  const Settings(this.id, {Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .01),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text('Account Setting',
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: h * .345,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListItem(
                    listname: 'Edit Profile',
                    listicon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => EditProfile(widget.id),
                        ),
                      );
                    },
                  ),
                  ListItem(
                    listname: 'Change Password',
                    listicon: const Icon(Icons.password),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ChangePassword(),
                        ),
                      );
                    },
                  ),
                  ListItem(
                      listname: 'Logout',
                      listicon: const Icon(Icons.logout),
                      onPressed: () => FirebaseAuth.instance.signOut()),
                  ListItem(
                    listname: 'Delete Account',
                    listicon: const Icon(Icons.delete_forever),
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
                                        content:
                                            Text('Data User Berhasil Dihapus'),
                                      ),
                                    ),
                                  );
                                  FirebaseAuth.instance.currentUser!.delete();
                                  Navigator.pop(context);
                                },
                                child: const Text('Yes')),
                            TextButton(
                                onPressed: () => Navigator.pop(context, "No"),
                                child: const Text('No')),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child:
                  Text('Help', style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: h * .181,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListItem(
                    listname: 'Contact Us',
                    listicon: const Icon(Icons.phone_enabled_rounded),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ContactUs(),
                        ),
                      );
                    },
                  ),
                  ListItem(
                    listname: 'App Info',
                    listicon: const Icon(Icons.info),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const AppInfo(),
                        ),
                      );
                    },
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

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.listname,
    required this.listicon,
    required this.onPressed,
  }) : super(key: key);

  final String listname;
  final Icon listicon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(listname),
        leading: listicon,
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onPressed);
  }
}
