//
//  AppTableViewController.h
//  analytics
//
//  Created by tester1 on 4/11/13.
//  Copyright (c) 2013 tester1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/objc-class.h>
#import "AppTableViewController.h"



@interface AppTableViewController : UITableViewController
{
    NSMutableArray *cellNames;
}
-(id)init;
-(NSMutableArray *)readCellNamesFromPlist;
-(void)eraseCellNameFromPlist:(int)index;

-(NSNumber *)getNSNumber:(float)float_value;
-(NSNumber *)newMethod;
-(void)forwarderMethod;
@end
