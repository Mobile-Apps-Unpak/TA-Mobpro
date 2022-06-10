import 'modul_view_stack.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'navigation_controls.dart';

class ModulView extends StatefulWidget {
  const ModulView({Key? key}) : super(key: key);

  @override
  State<ModulView> createState() => _ModulViewAppState();
}

class _ModulViewAppState extends State<ModulView> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul'),
        backgroundColor: const Color.fromARGB(255, 255, 212, 76),
        actions: [
          NavigationControls(controller: controller),
        ],
        elevation: 0,
      ),
      body: ModulViewStack(controller: controller),
    );
  }
}
