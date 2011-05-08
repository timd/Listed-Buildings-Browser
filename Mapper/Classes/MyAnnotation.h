//
//  MyAnnotation.h
//  Mapper
//
//  Created by Tim Duckett on 28/03/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MyAnnotation : NSObject {
	
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;

}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

@end
