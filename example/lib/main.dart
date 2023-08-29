import 'package:flutter/material.dart';
import 'package:firebase_app_indexing/firebase_app_indexing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  String url = 'https://wiseminds.cc';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 600),
            TextButton(
                onPressed: () => FirebaseAppIndexing.start('Home', url),
                child: Text('Start')),
            TextButton(
                onPressed: () => FirebaseAppIndexing.stop('Home', url),
                child: Text('Stop')),
          ],
        ),
      ),
    );
  }
}
