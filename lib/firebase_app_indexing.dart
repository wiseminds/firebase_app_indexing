import 'dart:io';

import 'package:flutter/services.dart';
/// Google Search uses information about the actions users take on public and personal content in an app to improve ranking for Search results and suggestions. To improve your users' experience when they search for content in your app, log user actions through the App Indexing API.
///
/// What actions should you log?
/// Use the following guidelines as you log user actions:
///
/// Log the user's interactions with the app, including viewing content, creating new content, or sharing content.
/// 
/// Only log actions the user takes on content directly — not background actions within the app like incoming messages or playlist syncs.
/// 
/// Don't log actions for each item in a list when a user interacts with the entire list. For example, don't log view actions for each message whenever a user opens their inbox.
/// 
/// For actions that take place over a longer duration, call both the start() and end() methods, accordingly.
///
/// For instantaneous actions, call the end() method as soon as the user takes the action. For example, when a user comments on a note, log an instantaneous action with a single call of the end() method.
class FirebaseAppIndexing {
  static const MethodChannel _channel =
      const MethodChannel('firebase_app_indexing'); 

 /// log an action, start a session
  static start(String title, String url) async {
    if(Platform.isAndroid)
    await _channel.invokeMethod('start', {'title': title, 'url': url});
  }

 /// log an action, end a session
   static stop(String title, String url) async {
    if(Platform.isAndroid)
    await _channel.invokeMethod('stop', {'title': title, 'url': url});
  }
}
