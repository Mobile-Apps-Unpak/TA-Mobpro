import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xffffd44c)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
            ),
            const Text('Created By Kelompok 1'),
          ],
        ),
      ),
    );
  }
}
