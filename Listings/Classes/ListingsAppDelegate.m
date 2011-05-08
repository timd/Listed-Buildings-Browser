//
//  ListingsAppDelegate.m
//  Listings
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ListingsAppDelegate.h"
#import "Building.h"
#import "MapViewController.h"

@implementation ListingsAppDelegate

@synthesize window;
@synthesize tempBuildingsArray;
@synthesize mapViewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	
	
	// Load up some dummy objects for plotting onto the map
	

	// Create an object ready
	
	float default_latitude = 53.374288;
	float default_longitude = -1.538863;
	
	Building *building = [[Building alloc] init];
	
	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	
	for (int i=0; i < 4; i++) {
		
		NSLog(@"Creating object %i", i);
		
		building.name = [NSString stringWithFormat:@"Building %d", i];
		
		NSLog(@"Building name = %@", [building name]);
		
		building.latitude = (default_latitude + (i * 0.1));

		NSLog(@"Building lat = %f", [building latitude]);
		
		building.longitude = (default_longitude + (i * 0.1));
		
		NSLog(@"Building long = %f", [building longitude]);
		
		building.lb_uid = (1234 + i);
		
		NSLog(@"Building lb_uid = %d", [building lb_uid]);
		
		building.street_nam = [NSString stringWithFormat:@"Street Name%d",i];
		
		NSLog(@"Building street_nam = %@", [building street_nam]);
		
		building.street_num = [NSString stringWithFormat:@"12%d", i];
		
		NSLog(@"Building stree_num = %@", [building street_num]);
		
		building.grade = @"II*";
		
		NSLog(@"Building grade = %@", [building grade]);
		
		building.date_of_en = @"2010-02-01";
		
		NSLog(@"Building date_of_en = %@", [building date_of_en]);
		
		[tempArray addObject:building];
		
		NSLog(@"Count = %d", [tempArray count]);
			
	}
	
	tempBuildingsArray = tempArray;
	NSLog(@"Count of tempBuildingsArray = %d", [tempBuildingsArray count]);
	
	[tempArray release];
	[building release];
	
	[window addSubview:mapViewController.view];
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[mapViewController release];
    [window release];
		
    [super dealloc];
}


@end
