import 'dart:async';

import 'package:flutter/services.dart';

class FirebaseAppIndexing {
  static const MethodChannel _channel =
      const MethodChannel('firebase_app_indexing');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static start(String title, String url) async {
    await _channel.invokeMethod('start', {'title': title, 'url': url});
  }

   static stop(String title, String url) async {
    await _channel.invokeMethod('stop', {'title': title, 'url': url});
  }
}
