//
//  scratchAppDelegate.m
//  scratch
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import "scratchAppDelegate.h"
#import "scratchViewController.h"

@implementation scratchAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
