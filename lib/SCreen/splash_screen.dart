import 'dart:async';

import 'package:easysolution/SCreen/home_screen.dart';
import 'package:easysolution/SCreen/singleurl_screen.dart';
import 'package:easysolution/SCreen/url1_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //       context, CupertinoPageRoute(builder: (context) => HomeScreen()));
    // });
    whereTogo();
  }

  void whereTogo() async {
    var sp = await SharedPreferences.getInstance();
    String? url1 = sp.getString('url1');
    String? url2 = sp.getString('url2');
    if (sp.getString('url1') == null) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => HomeScreen()));
    } else if (url1 != null) {
      if (url2!.isEmpty) {
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (context) => SingleUrlScreen(url1: url1)));
      } else if (url2.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (context) => Url1SCreen(url1: url1, url2: url2)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

