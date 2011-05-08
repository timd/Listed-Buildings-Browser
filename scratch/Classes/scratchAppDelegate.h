//
//  scratchAppDelegate.h
//  scratch
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class scratchViewController;

@interface scratchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    scratchViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet scratchViewController *viewController;

@end

