import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(children: [
      const SizedBox(height: 70),
      Image.asset('vector_login.png', width: 250, height: 250),
      const SizedBox(height: 20),
      const Text('Welcome back!',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
      const SizedBox(height: 10),
      const Text('log in to your account',
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 12, color: Colors.grey)),
      Container(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            )),
            const SizedBox(height: 20),
            TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_open),
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
              return const LoginPage();
            }));
          },
          child: const Text("LOG IN",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 40),
              shape: const StadiumBorder(),
              primary: const Color.fromARGB(255, 255, 212, 76))),
      const SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Dont have an account?',
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 12, color: Colors.grey),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Sign Up',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 212, 76), fontSize: 12),
            ),
            style: TextButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 212, 76)),
          )
        ],
      ),
    ]))));
  }
}
