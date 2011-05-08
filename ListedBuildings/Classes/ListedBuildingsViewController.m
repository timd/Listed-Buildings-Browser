//
//  ListedBuildingsViewController.m
//  ListedBuildings
//
//  Created by Tim Duckett on 31/03/2010.
//  Copyright Charismatic Megafauna Ltd 2010. All rights reserved.
//

#import "ListedBuildingsViewController.h"
#import "Building.h"
#import <MapKit/MapKit.h>

@implementation ListedBuildingsViewController

@synthesize mapView;
@synthesize buildingsArray;


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
	
	mapView.mapType = MKMapTypeStandard;	// Set map type to standard view
	
	
	
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


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark Private Methods

-(NSArray *)arrayOfBuildings {
	
	// Array to create and return an array of temporary Building objects
	
	

	
	CLLocationCoordinate2D firstLocation = [[CLLocationCoordinate2D alloc] initWithLatitude:53.37429 longitude:-1.53885];
	
	CLLocationCoordinate2D firstLocation;
	coord.longitude = (CLLocationDegrees)aATM.Longitude;
	coord.latitude = (CLLocationDegrees)aATM.Latitude;
	
	CLLocationCoordinate2D secondLocation = [[CLLocationCoordinate2D alloc] initWithLatitude:53.38429 longitude:-1.54885];
	CLLocationCoordinate2D thirdLocation = [[CLLocationCoordinate2D alloc] initWithLatitude:53.36429 longitude:-1.52885];
	
	Building *buildingOne = [[Building alloc] init];
	buildingOne.lb_uid = 1234;
	buildingOne.name = @"BuildingOne";
	buildingOne.grade = @"II*";
	buildingOne.coordinate = firstLocation;

	Building *buildingTwo = [[Building alloc] init];
	buildingOne.lb_uid = 3456;
	buildingOne.name = @"BuildingTwo";
	buildingOne.grade = @"I";
	buildingOne.coordinate = secondLocation;
	
	Building *buildingThree = [[Building alloc] init];
	buildingOne.lb_uid = 5678;
	buildingOne.name = @"BuildingThree";
	buildingOne.grade = @"II";
	buildingOne.coordinate = thirdLocation;
	
	NSArray *tempArray = [[NSArray alloc] initWithObjects:buildingOne, buildingTwo, buildingThree, nil];
	buildingsArray = tempArray;
	
	return buildingsArray;
	
	
	
	
}

@end
