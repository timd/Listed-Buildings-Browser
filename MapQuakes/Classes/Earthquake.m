//
//  Earthquake.m
//  MapQuakes
//
//  Created by Bill Dudney on 6/19/09.
//  Copyright 2009 Gala Factory Software LLC. All rights reserved.
//

#import "Earthquake.h"

@implementation Earthquake

@synthesize place = _place;
@synthesize magnitude = _magnitude;
@synthesize lastUpdate = _lastUpdate;
@synthesize detailsURL = _detailsURL;
@synthesize location = _location;

- (void) dealloc {
  self.place = nil;
  self.magnitude = nil;
  self.lastUpdate = nil;
  self.detailsURL = nil;
  self.location = nil;
  [super dealloc];
}

@end
