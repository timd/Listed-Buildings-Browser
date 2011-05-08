//
//  MapperViewController.m
//  Mapper
//
//  Created by Tim Duckett on 28/03/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MapperViewController.h"
#import "MyAnnotation.h"

@implementation MapperViewController

@synthesize mapView;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	[mapView setMapType:MKMapTypeHybrid];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
	
	MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
	region.center.latitude = 53.374376;
	region.center.longitude = -1.538516;
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;
	[mapView setRegion:region animated:YES];
	
	[mapView setShowsUserLocation:YES];
	
	StoreLocation *theLocation;
	CLLocationCoordinate2D theCoordinate;
	theCoordinate.latitude = 45.489993;
	theCoordinate.longitude = -75.669464;
	theLocation = [[StoreLocation alloc] initWithCoordinate:theCoordinate];
	theLocation.title = @"Soundshift Store";
	theLocation.subtitle = @"World Headquarters";
	[mapView addAnnotation:theLocation];
	[theLocation release];
	
	[mapView setDelegate:self];

}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id)annotation {

	MKPinAnnotationView *pinView = nil;
	
	if (annotation != mapView.userLocation) {
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if (pinView == nil) {
			pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
		}
		pinView.pinColor = MKPinAnnotationColorRed;
		pinView.canShowCallout = YES;
		pinView.animatesDrop = YES;
	}
	else {
		[mapView.userLocation setTitle:@"I am here"];
	}
	return pinView;

}


- (void)dealloc {
	
	[mapView release];
    [super dealloc];
}

@end
