//
//  JRAppDelegate.m
//
//  Copyright 2016 Go Travel Un Limited
//  This code is distributed under the terms and conditions of the MIT license.
//

#import "JRAppDelegate.h"
#import "JRColorScheme.h"

@implementation JRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [AppConfigurator configure];
    [AppearanceSettings setup];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    self.window.tintColor = [JRColorScheme mainColor];

    self.window.rootViewController = [[TabMenuVC alloc] init];

    [self.window makeKeyAndVisible];

    return YES;
}

@end
