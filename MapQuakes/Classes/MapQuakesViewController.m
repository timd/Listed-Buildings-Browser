//
//  MapQuakesViewController.m
//  MapQuakes
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import "MapQuakesViewController.h"
#import "Earthquake.h"
#import "EarthquakeParser.h"
#import "EarthquakeAnnotation.h"

@implementation MapQuakesViewController

@synthesize mapView = _mapView;

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)addEarthquake:(Earthquake *)earthquake {
	if ([self.mapView.userLocation.location getDistanceFrom:earthquake.location] < 250.f){
		EarthquakeAnnotation *eqAnn = [EarthquakeAnnotation annotationWithEarthquake:earthquake];
		[self.mapView addAnnotation:eqAnn];
	}
}

- (void)parserFinished {
	// leaving blank
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
	
	MKAnnotationView *view = nil;
	
	if (annotation != mapView.userLocation) {
		
		EarthquakeAnnotation *eqAnn = (EarthquakeAnnotation*)annotation;
		
		view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"earthquakeLoc"];
		
		if(nil == view) {
			view = [[[MKPinAnnotationView alloc] initWithAnnotation:eqAnn
													reuseIdentifier:@"earthquakeLoc"] autorelease];
		}
		
		CGFloat magnituide = [eqAnn.earthquake.magnitude floatValue];
		
		if(magnituide >= 4.0f) {
			
			[(MKPinAnnotationView *)view setPinColor:MKPinAnnotationColorRed];
			
		}
		else if(magnituide >= 3.0f) {
			
			[(MKPinAnnotationView *)view setPinColor:MKPinAnnotationColorPurple];
			
		} 
		else if(magnituide >= 2.0f) {
			
			[(MKPinAnnotationView *)view setPinColor:MKPinAnnotationColorGreen];
			
		}
		
		[(MKPinAnnotationView *)view setAnimatesDrop:YES];
		
		[view setCanShowCallout:YES];
	} else {
	
		EarthquakeParser *parser = [EarthquakeParser earthquakeParser];
		parser.delegate = self;
		[parser getEarthquakeData];

	}

	return view;	
}

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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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


- (void)dealloc {
    [super dealloc];
}

@end
