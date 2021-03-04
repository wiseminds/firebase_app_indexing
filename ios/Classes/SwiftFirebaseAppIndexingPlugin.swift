import Flutter
import UIKit

public class SwiftFirebaseAppIndexingPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "firebase_app_indexing", binaryMessenger: registrar.messenger())
    let instance = SwiftFirebaseAppIndexingPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
