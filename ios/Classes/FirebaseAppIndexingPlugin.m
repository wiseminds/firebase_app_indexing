#import "FirebaseAppIndexingPlugin.h"
#if __has_include(<firebase_app_indexing/firebase_app_indexing-Swift.h>)
#import <firebase_app_indexing/firebase_app_indexing-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "firebase_app_indexing-Swift.h"
#endif

@implementation FirebaseAppIndexingPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFirebaseAppIndexingPlugin registerWithRegistrar:registrar];
}
@end
