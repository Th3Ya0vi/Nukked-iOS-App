//
//  AppDelegate.m
//  Nukkad
//
//  Created by Shiva Srivastava on 4/21/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate(Private)
-(void)SetUpNotificationListner;
@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self SetUpNotificationListner];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)SetUpNotificationListner
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ShowLoadingView:)
                                                 name:SHOW_LOADING_VIEW_NOTIFICATION_NAME
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(HideLoadingView:)
                                                 name:HIDE_LOADING_VIEW_NOTIFICATION_NAME
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ReloadViews:)
                                                 name:RELOAD_ALL_VIEWS_NOTICATION_NAME
                                               object:nil];
}

-(void)ShowLoadingView:(NSNotification *)notification
{
    LoadingView = [[MBProgressHUD alloc] initWithWindow:self.window];
    [self.window addSubview:LoadingView];
    LoadingView.labelText = [notification object];
    [self.window bringSubviewToFront:LoadingView];
    [LoadingView showUsingAnimation:YES];
    [LoadingView show:YES];
}

-(void)HideLoadingView:(NSNotification *)notification
{
    if(LoadingView)
    {
        [LoadingView hideUsingAnimation:NO];
        [LoadingView removeFromSuperViewOnHide];
    }
}

@end
