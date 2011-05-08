//
//  MyAnnotation.m
//  Mapper
//
//  Created by Tim Duckett on 28/03/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyAnnotation.h"


@implementation MyAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

-(void)dealloc {
	[title release];
	[subtitle release];
	[super dealloc];
}


@end
