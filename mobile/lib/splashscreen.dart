import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mobile/utils/wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Wrapper(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(80, 100, 80, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo Vector
              Image.asset('assets/vector.png', width: 250, height: 250),
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
    );
  }
}
