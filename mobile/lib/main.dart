import 'package:flutter/material.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/awal_login.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/regist_page.dart';
import 'package:mobile/homepage.dart';
import 'package:mobile/mainpage.dart';
import 'package:mobile/modul.dart';
import 'package:mobile/payment.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AwalLogin(),
    );
  }
}
