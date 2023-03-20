import 'dart:async';
import 'package:easysolution/SCreen/url1_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Url2Screen extends StatefulWidget {
  final String url1;
  final String url2;
  const Url2Screen({Key? key, required this.url1, required this.url2})
      : super(key: key);

  @override
  State<Url2Screen> createState() => _Url2ScreenState();
}

class _Url2ScreenState extends State<Url2Screen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url2));
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Url1SCreen(url1: widget.url1, url2: widget.url2)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
