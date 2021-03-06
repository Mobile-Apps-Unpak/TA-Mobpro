import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class VideoViewStack extends StatefulWidget {
  const VideoViewStack({required this.controller, Key? key}) : super(key: key);

  final Completer<WebViewController> controller;

  @override
  State<VideoViewStack> createState() => _VideoViewStackState();
}

class _VideoViewStackState extends State<VideoViewStack> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl:
              'https://io.google/2022/program/a2114fc4-10f7-4071-a065-69dc727aeaa5/',
          onWebViewCreated: (webViewController) {
            widget.controller.complete(webViewController);
          },
          onPageStarted: (url) {
            setState(
              () {
                loadingPercentage = 0;
              },
            );
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(
              () {
                loadingPercentage = 100;
              },
            );
          },
          javascriptMode: JavascriptMode.unrestricted,
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
