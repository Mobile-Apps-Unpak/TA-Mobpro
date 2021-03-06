import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class ModulViewStack extends StatefulWidget {
  final String? url;
  const ModulViewStack(this.url, {required this.controller, Key? key})
      : super(key: key);

  final Completer<WebViewController> controller;

  @override
  State<ModulViewStack> createState() => _ModulViewStackState();
}

class _ModulViewStackState extends State<ModulViewStack> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: widget.url,
          onWebViewCreated: (webViewController) {
            widget.controller.complete(webViewController);
          },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            color: Theme.of(context).iconTheme.color,
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
