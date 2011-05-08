//
//  Building.h
//  Listings
//
//	Model for core Building class
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright 2010 Charismatic Megafauna Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Building : NSObject {
	
	NSInteger lb_uid;
	double latitude;
	double longitude;
	NSString *name;
	NSString *street_num;
	NSString *street_nam;
	NSString *date_of_en;
	NSString *grade;
	
}

@property (readwrite, assign) NSInteger lb_uid;
@property (readwrite, assign) double latitude;
@property (readwrite, assign) double longitude;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *street_num;
@property (nonatomic, retain) NSString *street_nam;
@property (nonatomic, retain) NSString *date_of_en;
@property (nonatomic, retain) NSString *grade;

@end
