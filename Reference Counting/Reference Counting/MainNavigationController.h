//
//  MainNavigationController.h
//  analytics
//
//  Created by tester1 on 4/5/13.
//  Copyright (c) 2013 tester1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppTableViewController.h"

@interface MainNavigationController : UINavigationController
{
    AppTableViewController *appTableViewController;
}

-(id)init;

@end
