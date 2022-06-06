import 'package:flutter/material.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/regist_page.dart';

class Cover extends StatelessWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Page Background Color
        color: const Color.fromARGB(255, 255, 212, 76),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 7,
                //Logo With Second Layer
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(80, 100, 80, 0),
                    child: Column(
                      children: [
                        //Logo Vector
                        Image.asset('assets/vector.png',
                            width: 250, height: 250),
                        const SizedBox(height: 10),
                        Image.asset(
                          //Logo Text
                          'assets/logo_study.png',
                          width: 150,
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(50),
                  child: Column(
                    children: [
                      //Button Login
                      ElevatedButton(
                        //Move to Login Page after button pressed
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 40),
                            shape: const StadiumBorder(),
                            primary: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      //Button Register
                      ElevatedButton(
                        //Move to Register Page after button pressed
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const RegistPage(),
                            ),
                          );
                        },
                        child: const Text("REGISTER",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300)),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 40),
                            shape: const StadiumBorder(),
                            primary: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
