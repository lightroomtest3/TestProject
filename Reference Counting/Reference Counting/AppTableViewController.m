//
//  AppTableViewController.m
//  analytics
//
//  Created by tester1 on 4/11/13.
//  Copyright (c) 2013 tester1. All rights reserved.
//

#import "AppTableViewController.h"

@implementation AppTableViewController


-(id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        self.title = @"Apps";
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{ NSLog(@"dispatch once");});
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //cellNames = [self readCellNamesFromPlist];
    cellNames = [NSArray arrayWithObject:@{@"app_name" : @"name", @"api_key" : @"apikey", @"app_id" : @"appid"}];
    
    NSMutableArray *toolBarItems = [NSMutableArray array];
    UIBarButtonItem *addBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                  target:self
                                                                                  action:@selector(onAddButtonClick)];
    addBarBtn.style = UIBarButtonItemStyleBordered;
    [toolBarItems addObject:addBarBtn];
    [self setToolbarItems:toolBarItems animated:NO];
    
    
//    SEL getNSNumberSel = @selector(getNSNumber:);
//    Method getNSNumberMethod = class_getInstanceMethod([self class], getNSNumberSel);
//    
//    SEL newMethodSel = @selector(newMethod);
//    Method newMethodMethod = class_getInstanceMethod([self class], newMethodSel);
//    IMP newMethodImplementation = method_getImplementation(newMethodMethod);
//    
//    method_setImplementation(getNSNumberMethod, newMethodImplementation);
    
}


-(NSMutableArray *)readCellNamesFromPlist
{
    //NSMutableArray *readedNames = [NSArray arrayWithContentsOfFile:FILE_TO_STORE_APPS_DATA];
//    if (readedNames == nil)
//        return [NSMutableArray array];
//    else return readedNames;
}

-(void)eraseCellNameFromPlist:(int)index
{
//    NSMutableArray *readedNames = [self readCellNamesFromPlist];
//    NSMutableArray *namesToWrite = [NSMutableArray array];
//    for(int i = 0; i < [readedNames count]; i++)
//    {
//        NSDictionary *dict = [readedNames objectAtIndex:i];
//        if (i != index)
//           [namesToWrite addObject:dict];
//    }
    //[namesToWrite writeToFile:FILE_TO_STORE_APPS_DATA atomically:YES];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [cellNames count];
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [[cellNames objectAtIndex:indexPath.row] objectForKey:@"app_name"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *apiKey = [[cellNames objectAtIndex:indexPath.row] objectForKey:@"api_key"];
    NSString *appId = [[cellNames objectAtIndex:indexPath.row] objectForKey:@"app_id"];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self eraseCellNameFromPlist:indexPath.row];
         cellNames = [self readCellNamesFromPlist];
        [self.tableView reloadData];
    }
   
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:animated];
    //cellNames = [self readCellNamesFromPlist];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:YES animated:animated];
}

-(NSDictionary *)onAddButtonClick
{
    NSLog(@"AddButtonClicked");
    NSDictionary *dict;
    //dict = [NSDictionary dictionary];
    dict = [[NSDictionary alloc]init];
    [dict release];
    //NSLog(@"dict.retainCount = %ld", dict.retainCount);
    
    NSMethodSignature *mySignature = [[self class] instanceMethodSignatureForSelector:@selector(newMethod)];
    if (mySignature == nil)
    {
        NSLog(@"mySignature is nil");
    }
    else
    {
        NSInvocation *inv = [NSInvocation invocationWithMethodSignature:mySignature];
        //NSInvocation *inv = [[NSInvocation alloc]init];
        [inv setTarget:self];
        [inv setSelector:@selector(forwarderMethod)];
        [inv invoke];
        //[self forwardInvocation:inv];
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ NSLog(@"dispatch once");});
    
    NSNumber *myNumber = [self getNSNumber:16];
    NSLog(@"myNumber = %@", myNumber);
    //[myNumber retain];
    //[myNumber release];
    //[myNumber release];
    //NSLog(@"myNumber.retainCount after release = %d", myNumber.retainCount);

    return dict;
}

-(NSNumber *)getNSNumber:(float)float_value
{
    NSNumber *number = [[NSNumber alloc]initWithFloat:float_value];
    NSLog(@"number.retainCount = %d", number.retainCount);
    return number;
    //return [number autorelease];

        
  
    //dispatch_once( (^){});
}

-(NSNumber *)newMethod
{

    NSLog(@"newMethod executed");
    return [NSNumber numberWithInteger:5];
}

-(void)forwarderMethod
{
    NSLog(@"forwarder method called");
}

@end


