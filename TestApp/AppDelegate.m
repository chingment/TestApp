//
//  AppDelegate.m
//  TestApp
//
//  Created by chingment on 15/6/17.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

static const int ddLogLevel=LOG_LEVEL_VERBOSE;

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    //使用CocoaLumberjack 日志框架,配置信息
    //[DDLog addLogger:[DDASLLogger sharedInstance]];//发送日志语句到苹果的日志系统，在Console显示
    [DDLog addLogger:[DDTTYLogger sharedInstance]];//发送日志语句到Xcode控制台,
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
   
    DDLogInfo(@"程序已经启动...");
    
    [NSThread sleepForTimeInterval:2];//等待2秒后进入程序,用来显示lauchimage
    
    NSString *kcfBundleVersionKey = (NSString *)kCFBundleVersionKey;//对应在info.plist的Bundle version 键
    NSString *kcfBundleVersionValue = [NSBundle mainBundle].infoDictionary[kcfBundleVersionKey];//对应在info.plist的Bundle version的键值
    NSString *lastKcfBundleVersionValue = [[NSUserDefaults standardUserDefaults] objectForKey:kcfBundleVersionKey];//从沙盒中取出上次存储的版本号
    
    if ([kcfBundleVersionValue isEqualToString:lastKcfBundleVersionValue]) { // 不是第一次使用这个版本
        // 显示状态栏
       // application.statusBarHidden = YES;
        
    } else {
        // application.statusBarHidden = YES;
        // 版本号不一样：第一次使用新版本
        // 将新版本号写入沙盒
        [[NSUserDefaults standardUserDefaults] setObject:kcfBundleVersionValue forKey:kcfBundleVersionKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //加载程序运行的第一个视图控制器
    
    //加载登陆视图控制器
    //LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    //self.window.rootViewController = loginViewController;
    
    //指定程序的根视图控制器
    //[加载开启程序]指南视图控制器
    GuideViewController *guideViewController = [[GuideViewController alloc] initWithNibName:nil bundle:nil];
    //TestViewController *guideViewController = [[TestViewController alloc] initWithNibName:nil bundle:nil];

    self.window.rootViewController = guideViewController;
    
    //设置window的背景颜色,默认黑色
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    DDLogInfo(@"程序将要失去焦点...");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    DDLogInfo(@"程序已经进入后台...");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    DDLogInfo(@"程序将要进入前台...");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    DDLogInfo(@"程序已经获得焦点...");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    DDLogInfo(@"程序将要终止...");
}

@end
