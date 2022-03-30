#import "AppDelegate.h"
#import <Flutter/Flutter.h>
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate
- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
  FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;

  FlutterMethodChannel* browserChannel = [FlutterMethodChannel
                                          methodChannelWithName:@"open.browser"
                                          binaryMessenger:controller.binaryMessenger];

  [browserChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
    if ([@"launchBrowser" isEqualToString:call.method]) {
        launchBrowser;
        result(@(1));
    } else {
        result(FlutterMethodNotImplemented);
    }
  }];

  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)launchBrowser {
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://flutter.dev"]];
}

@end
