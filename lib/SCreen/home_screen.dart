import 'package:easysolution/SCreen/singleurl_screen.dart';
import 'package:easysolution/SCreen/url1_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController url1Controller = TextEditingController();
  TextEditingController url2Controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // void setUrlIfSaved() async {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HOMESCREEN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'URL 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: url1Controller,
              decoration: InputDecoration(
                  hintText: 'URL 1',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              onChanged: (value) {
                // do something
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'URL 2',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: url2Controller,
              decoration: InputDecoration(
                  hintText: 'URL 2',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              onChanged: (value) {
                // do something
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  if (url2Controller.text.isEmpty) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                SingleUrlScreen(url1: url1Controller.text)));
                    var sp = await SharedPreferences.getInstance();
                    sp.setString('url1', url1Controller.text);
                    sp.setString('url2', url2Controller.text);
                  } else {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => Url1SCreen(
                                  url1: url1Controller.text,
                                  url2: url2Controller.text,
                                )));
                    var sp = await SharedPreferences.getInstance();
                    sp.setString('url1', url1Controller.text);
                    sp.setString('url2', url2Controller.text);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
