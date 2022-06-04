import 'package:flutter/material.dart';
import 'package:mobile/home.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/awal_login.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/regist_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
