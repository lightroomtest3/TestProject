//
//  AppDelegate.h
//  Reference Counting
//
//  Created by tester1 on 4/15/13.
//  Copyright (c) 2013 tester1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MainNavigationController *mainNavigationController;
}
@property (strong, nonatomic) UIWindow *window;

@end
