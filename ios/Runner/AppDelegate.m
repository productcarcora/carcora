#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Add the following line, with your API key
  [GMSServices provideAPIKey: @"AIzaSyDQnHa1RYzFYrilQKg"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
  // Override point for customization after application launch.
}

@end
