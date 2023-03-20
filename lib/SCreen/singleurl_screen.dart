import 'dart:async';
import 'package:easysolution/SCreen/ur2_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SingleUrlScreen extends StatefulWidget {
  final String url1;

  const SingleUrlScreen({Key? key, required this.url1}) : super(key: key);

  @override
  State<SingleUrlScreen> createState() => _SingleUrlScreenState();
}

class _SingleUrlScreenState extends State<SingleUrlScreen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url1));
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
