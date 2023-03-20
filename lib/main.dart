import 'package:easysolution/SCreen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SCreen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController url1Controller = TextEditingController();
  TextEditingController url2Controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // checkUrlAvailable();
    super.initState();
  }

  // void checkUrlAvailable() async {
  //   var sp = await SharedPreferences.getInstance();
  //   if (sp.getString('url1')!.isNotEmpty) {
  //     sp.getString('url1') != null
  //         ? url1Controller.text = sp.getString('url1')!
  //         : null;
  //     sp.getString('url2') != null
  //         ? url2Controller.text = sp.getString('url2')!
  //         : null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
