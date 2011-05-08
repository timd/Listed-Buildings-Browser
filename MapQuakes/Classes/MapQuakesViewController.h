//
//  MapQuakesViewController.h
//  MapQuakes
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "EarthquakeParser.h"

@interface MapQuakesViewController : UIViewController <MKMapViewDelegate, EarthquakeParserDelegate> {

	MKMapView *_mapView;
		
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end

