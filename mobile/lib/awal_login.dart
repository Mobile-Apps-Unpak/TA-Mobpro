import 'package:flutter/material.dart';
import 'package:mobile/awal_login.dart';
import 'package:mobile/login_page.dart';

class AwalLogin extends StatelessWidget {
  const AwalLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 255, 212, 76)),
        home: Scaffold(
            body: Center(
          child: Column(children: [
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Container(
                  margin: EdgeInsets.fromLTRB(80, 100, 80, 0),
                  child: Column(children: [
                    Image.asset('vector.png', width: 250, height: 250),
                    SizedBox(height: 10),
                    Image.asset(
                      'logo_study.png',
                      width: 150,
                      height: 150,
                    )
                  ]),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                          child: Text("LOG IN",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300)),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 40),
                              shape: StadiumBorder(),
                              primary: Colors.white)),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text("Register",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300)),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 40),
                              shape: StadiumBorder(),
                              primary: Colors.white))
                    ],
                  ),
                ))
          ]),
        )));
  }
}
