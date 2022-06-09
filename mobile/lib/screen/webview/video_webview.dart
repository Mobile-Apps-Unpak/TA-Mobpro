import 'package:mobile/screen/webview/menu.dart';
import 'package:mobile/screen/webview/video_view_stack.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'navigation_controls.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewAppState();
}

class _VideoViewAppState extends State<VideoView> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
        backgroundColor: const Color.fromARGB(255, 255, 212, 76),
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller),
        ],
      ),
      body: VideoViewStack(controller: controller),
    );
  }
}
