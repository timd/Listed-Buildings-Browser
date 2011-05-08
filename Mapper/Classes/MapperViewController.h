//
//  MapperViewController.h
//  Mapper
//
//  Created by Tim Duckett on 28/03/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapperViewController : UIViewController <MKMapViewDelegate> {

	IBOutlet MKMapView *mapView;

}

@property (nonatomic, retain) MKMapView *mapView;

@end

