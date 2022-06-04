import 'package:flutter/material.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "Let's Gets Started",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            actions: [],
            backgroundColor: Colors.white,
            elevation: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("log in to your account",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Container(
                height: 400,
                padding: EdgeInsets.all(20),
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
              SizedBox(
                height: 170,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Register",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40),
                      shape: StadiumBorder(),
                      primary: Color.fromARGB(255, 255, 212, 76))),
            ],
          ),
        ),
      ),
    );
  }
}
