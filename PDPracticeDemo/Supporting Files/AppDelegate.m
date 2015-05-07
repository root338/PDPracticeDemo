//
//  AppDelegate.m
//  PDPracticeDemo
//
//  Created by apple on 15/4/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<NSURLSessionDelegate>
{
    NSURLSession *_session;
    NSURLSessionTask *_downloadTask;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /**
     *  设置获取间隔
     *
     *  如果不对最小后台获取间隔进行设定的话，系统使用默认的 UIApplicationBackgroundFetchIntervalNever
     *
     *  UIApplicationBackgroundFetchIntervalMinimum   系统会尽可能多尽可能快地为你的应用进行后台获取
     *  UIApplicationBackgroundFetchIntervalNever 永远不进行后台获取
     */
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskAll;
}

- (NSURLSession *)backgroundSession
{
    static NSURLSession *session = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.PD.backgroundSession"];
        session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    });
    
    return session;
}

- (void)beginDonwlaod
{
    NSURL *downloadURL = [NSURL URLWithString:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:downloadURL];
    _session = [self backgroundSession];
    _downloadTask = [_session downloadTaskWithRequest:request];
    [_downloadTask resume];
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler
{
    
    
    completionHandler();
}

//推送唤醒
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    
}

//在这个代理方法里处理fetch
- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    /**
     *  应用的数据获取处理
     */
    NSLog(@"后台gengxin");
    completionHandler(UIBackgroundFetchResultNewData);
    //当处理完成后调用 completionHandler 通知系统获取完成
//    UIBackgroundFetchResultNewData    获取到了新数据,
//    UIBackgroundFetchResultNoData     没有新数据,
//    UIBackgroundFetchResultFailed     获取失败
}
@end
