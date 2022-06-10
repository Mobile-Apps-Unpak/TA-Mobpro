import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/video.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            const Tittle(judul: 'Account Setting'),
            Container(
              padding: const EdgeInsets.all(5),
              height: height * .37,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListItem(
                    listname: 'Edit Profile',
                    listicon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Video()),
                      );
                    },
                  ),
                  ListItem(
                    listname: 'Change Password',
                    listicon: const Icon(Icons.password_sharp),
                    onPressed: () {},
                  ),
                  ListItem(
                    listname: 'Delete Account',
                    listicon: const Icon(Icons.delete_forever_sharp),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text("Do you agree?"),
                            content: Text("With this ridiculous statement."),
                          );
                        },
                      );
                    },
                  ),
                  ListItem(
                    listname: 'Logout',
                    listicon: const Icon(Icons.logout),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Tittle(judul: 'Help'),
            Container(
              padding: const EdgeInsets.all(5),
              height: height * .191,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListItem(
                    listname: 'Contact Us',
                    listicon: const Icon(Icons.phone),
                    onPressed: () {},
                  ),
                  ListItem(
                    listname: 'App Info',
                    listicon: const Icon(Icons.info_outline),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              child: Text("Click me for a dialog"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Delete Account"),
                      actions: [
                        ElevatedButton(onPressed: () {}, child: Text("No")),
                        ElevatedButton(onPressed: () {}, child: Text("Yes")),
                      ],
                    );
                  },
                );
              },
            )
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

class Tittle extends StatelessWidget {
  const Tittle({
    Key? key,
    required this.judul,
  }) : super(key: key);

  final String judul;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        judul,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
