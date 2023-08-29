import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:firebase_app_indexing/firebase_app_indexing.dart';

void main() {
  const MethodChannel channel = MethodChannel('firebase_app_indexing');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await FirebaseAppIndexing.platformVersion, '42');
  });
}
