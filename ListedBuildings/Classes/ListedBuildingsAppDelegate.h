//
//  ListedBuildingsAppDelegate.h
//  ListedBuildings
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListedBuildingsViewController;

@interface ListedBuildingsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ListedBuildingsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ListedBuildingsViewController *viewController;

@end

