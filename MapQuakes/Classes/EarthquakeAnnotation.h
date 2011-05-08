//
//  EarthquakeAnnotation.h
//  MapQuakes
//
//  Created by Screen Caster on 6/24/09.
//  Copyright 2009 Gala Factory Software LLC. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class Earthquake;

@interface EarthquakeAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D _coordinate;
	NSString *_title;
	NSString *_subtitle;
	Earthquake *_earthquake;
}

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;
@property(nonatomic, retain) Earthquake *earthquake;

+ (id)annotationWithEarthquake:(Earthquake *)earthquake;
- (id)initWithEarthquake:(Earthquake *)earthquake;

@end
