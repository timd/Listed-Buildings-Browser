//
//  ListingsAppDelegate.h
//  Listings
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Building.h"


@class MapViewController;

@interface ListingsAppDelegate : NSObject <UIApplicationDelegate> {
   
	UIWindow *window;

	NSMutableArray *tempBuildingsArray;
	
	MapViewController *mapViewController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) NSMutableArray *tempBuildingsArray;

@property (nonatomic, retain) IBOutlet MapViewController *mapViewController;


@end

