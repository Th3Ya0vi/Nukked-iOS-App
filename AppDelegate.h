//
//  AppDelegate.h
//  Nukkad
//
//  Created by Shiva Srivastava on 4/21/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeneralConstants.h"
#import "MBProgressHUD.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{

@private
    MBProgressHUD *LoadingView;
}

@property (strong, nonatomic) UIWindow *window;
@end
