//
//  MapperAppDelegate.h
//  Mapper
//
//  Created by Tim Duckett on 28/03/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapperViewController;

@interface MapperAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapperViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapperViewController *viewController;

@end

