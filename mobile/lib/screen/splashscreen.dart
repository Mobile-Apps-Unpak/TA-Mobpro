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
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo Vector
            Image.asset('assets/vector.png', width: w * 0.6, height: h * 0.3),
            Image.asset(
              //Logo Text
              'assets/logo_study.png',
              width: w * 0.3,
              height: w * 0.2,
            )
          ],
        ),
      ),
    );
  }
}
