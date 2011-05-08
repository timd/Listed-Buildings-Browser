//
//  MapQuakesAppDelegate.h
//  MapQuakes
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapQuakesViewController;

@interface MapQuakesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapQuakesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapQuakesViewController *viewController;

@end

