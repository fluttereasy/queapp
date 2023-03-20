import 'dart:async';
import 'package:easysolution/SCreen/ur2_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Url1SCreen extends StatefulWidget {
  final String url1;
  final String url2;

  const Url1SCreen({Key? key, required this.url1, required this.url2})
      : super(key: key);

  @override
  State<Url1SCreen> createState() => _Url1SCreenState();
}

class _Url1SCreenState extends State<Url1SCreen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url1));
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Url2Screen(
                    url1: widget.url1,
                    url2: widget.url2,
                  )));
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
