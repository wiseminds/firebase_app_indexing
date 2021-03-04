# firebase_app_indexing 

[![pub package](https://img.shields.io/badge/Pub-0.0.1-green.svg)](https://pub.dartlang.org/packages/firebase_app_indexing)

A Flutter plugin integrating the official android SDK for firebase app indexing 

To use the firebase_app_indexing plugin, [follow the instructions stated to add firebase to your app](https://pub.dev/packages/firebase_in_app_messaging)


## Usage

Import `package:firebase_app_indexing/firebase_app_indexing.dart`



Example:
```dart
import 'package:firebase_app_indexing/firebase_app_indexing.dart';
 

class App extends StatelessWidget {

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
            RaisedButton(
                onPressed: () => FirebaseAppIndexing.start('Home', url),
                child: Text('Start')),
            RaisedButton(
                onPressed: () => FirebaseAppIndexing.stop('Home', url),
                child: Text('Stop')),
          ],
        ),
      ),
    );
 }
}

```


See FirebaseAppIndexing docs for details on implementation documentation for more information.
[`Android App Indexing`](https://developer.android.com/training/app-indexing)
[`Firebase App Indexing`](https://firebase.google.com/docs/app-indexing)

 