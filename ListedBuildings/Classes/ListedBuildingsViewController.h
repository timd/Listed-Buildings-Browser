//
//  ListedBuildingsViewController.h
//  ListedBuildings
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class Building;

@interface ListedBuildingsViewController : UIViewController 
<CLLocationManagerDelegate, MKReverseGeocoderDelegate, MKMapViewDelegate>{

	MKMapView *mapView;
	NSArray *buildingsArray;
	
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSArray *buildingsArray;

-(NSArray *)arrayOfBuildings;

@end

