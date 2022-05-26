import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(children: [
      SizedBox(height: 70),
      Image.asset('vector_login.png', width: 250, height: 250),
      SizedBox(height: 20),
      Text('Welcome back!',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
      SizedBox(height: 10),
      Text('log in to your account',
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 12, color: Colors.grey)),
      Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            )),
            SizedBox(height: 20),
            TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                )),
          ],
        ),
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
          child: Text("LOG IN",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 40),
              shape: StadiumBorder(),
              primary: Color.fromARGB(255, 255, 212, 76))),
      SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dont have an account?',
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 12, color: Colors.grey),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 212, 76), fontSize: 12),
            ),
            style: TextButton.styleFrom(
                primary: Color.fromARGB(255, 255, 212, 76)),
          )
        ],
      ),
    ]))));
  }
}
