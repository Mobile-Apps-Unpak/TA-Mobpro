import 'package:flutter/material.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/awal_login.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/regist_page.dart';
import 'package:mobile/screen/homepage.dart';
import 'package:mobile/screen/mainpage.dart';
import 'package:mobile/package.dart';
import 'package:mobile/screen/profile.dart';
import 'package:mobile/setting.dart';
import 'package:mobile/video.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Settings(),
    );
  }
}
