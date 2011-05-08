//
//  EarthquakeAnnotation.m
//  MapQuakes
//
//  Created by Screen Caster on 6/24/09.
//  Copyright 2009 Gala Factory Software LLC. All rights reserved.
//

#import "EarthquakeAnnotation.h"
#import "Earthquake.h"

@implementation EarthquakeAnnotation

@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize earthquake = _earthquake;

+ (id)annotationWithEarthquake:(Earthquake *)earthquake {
	return [[[[self class] alloc] initWithEarthquake:earthquake] autorelease];
}

- (id)initWithEarthquake:(Earthquake *)earthquake {
	self = [super init];
	if(nil != self) {
		self.title = earthquake.place;
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"MMM dd, yyyy HH:mm"];
		self.subtitle = [NSString stringWithFormat:@"%@ - M%1.1f", 
						 [formatter stringFromDate:earthquake.lastUpdate], 
						 earthquake.magnitude.floatValue];
		[formatter release];
		self.coordinate = earthquake.location.coordinate;
		self.earthquake = earthquake;
	}
	return self;
}

- (void) dealloc {
	self.title = nil;
	self.subtitle = nil;
	self.earthquake = nil;
	[super dealloc];
}


@end
