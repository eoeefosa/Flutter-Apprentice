import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fooderlich/models/models.dart';

class WebViewScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      key: ValueKey(FooderlichPages.raywenderlich),
      name: FooderlichPages.raywenderlich,
      child: const WebViewScreen(),
    );
  }

  const WebViewScreen({Key? key}) : super(key: key);

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('raywenderlich.com'),
      ),
      body: const WebView(
        initialUrl: 'https://www.raywenderlich.com/',
      ),
    );
  }
}
