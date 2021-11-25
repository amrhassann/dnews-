import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({this.url});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('d News'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
