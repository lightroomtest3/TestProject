//
//  MainNavigationController.m
//  analytics
//
//  Created by tester1 on 4/5/13.
//  Copyright (c) 2013 tester1. All rights reserved.
//

#import "MainNavigationController.h"

@implementation MainNavigationController

-(id)init
{
    self = [super init];
    if (self)
    {
        appTableViewController = [[AppTableViewController alloc] init];
        [self pushViewController:appTableViewController animated:YES];
        //[self.navigationItem.backBarButtonItem setAction:@selector(OnBackButtonClick:)];
    }
    return self;
}

//-(void)OnBackButtonClick:(id)sender {
//    
//    //do your saving and such here
//    NSLog(@"Back");
//    [self.navigationController popViewControllerAnimated:YES];
//}

@end
