import 'package:flutter/material.dart';
import 'package:mobile/awal_login.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "Let's Gets Started",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            actions: const [],
            backgroundColor: Colors.white,
            elevation: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text("log in to your account",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Container(
                height: 400,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      )),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      )),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      )),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                        labelText: 'School',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      )),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          )),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Repeat Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 170,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("Register",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                      shape: const StadiumBorder(),
                      primary: const Color.fromARGB(255, 255, 212, 76))),
            ],
          ),
        ),
      ),
    );
  }
}
