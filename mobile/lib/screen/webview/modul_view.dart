import 'modul_view_stack.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'navigation_controls.dart';

class ModulView extends StatefulWidget {
  final String? url;
  const ModulView(this.url, {Key? key}) : super(key: key);

  @override
  State<ModulView> createState() => _ModulViewAppState();
}

class _ModulViewAppState extends State<ModulView> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(
          'Modul',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          NavigationControls(controller: controller),
        ],
        elevation: 0,
      ),
      body: ModulViewStack(widget.url, controller: controller),
    );
  }
}
