//
//  MapperAppDelegate.m
//  Mapper
//
//  Created by Tim Duckett on 28/03/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MapperAppDelegate.h"
#import "MapperViewController.h"

@implementation MapperAppDelegate

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
