import 'package:flutter/material.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                    Text("Let's Gets Started",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              Column(
                children: [
                  Text("log in to your account",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 20),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  )),
                  SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  )),
                  SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  )),
                  SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'School',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  )),
                  SizedBox(height: 10),
                  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      )),
                  SizedBox(height: 10),
                  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Repeat Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      )),
                  SizedBox(height: 100),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 40),
                          shape: StadiumBorder(),
                          primary: Color.fromARGB(255, 255, 212, 76))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
