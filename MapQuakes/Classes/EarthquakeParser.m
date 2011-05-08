//
//  EarthquakeParser.m
//  MapQuakes
//
//  Created by Bill Dudney on 6/19/09.
//  Copyright 2009 Gala Factory Software LLC. All rights reserved.
//

#import "EarthquakeParser.h"
#import "Earthquake.h"

@implementation EarthquakeParser

@synthesize currentEarthquake = _currentEarthquake;
@synthesize propertyValue = _propertyValue;
@synthesize retrieverQueue = _retrieverQueue;
@synthesize delegate = _delegate;

+ (id)earthquakeParser {
	return [[[self class] alloc] init];
}

- (NSOperationQueue *)retrieverQueue {
	if(nil == _retrieverQueue) {
		_retrieverQueue = [[NSOperationQueue alloc] init];
		_retrieverQueue.maxConcurrentOperationCount = 1;
	}
	return _retrieverQueue;
}

- (void)getEarthquakeData {
	SEL method = @selector(parseForData);
	NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self 
																	 selector:method 
																	   object:nil];
	[self.retrieverQueue addOperation:op];
	[op release];
}

static NSString *feedURLString = @"http://earthquake.usgs.gov/eqcenter/catalogs/7day-M2.5.xml";

// this method is fired by the operation created in
// getEarthquakeData so its on an alternate thread
- (BOOL)parseForData {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
  [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
  NSURL *url = [NSURL URLWithString:feedURLString];
  BOOL success = NO;
  NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
  [parser setDelegate:self];
  [parser setShouldProcessNamespaces:NO];
  [parser setShouldReportNamespacePrefixes:NO];
  [parser setShouldResolveExternalEntities:NO];
  success = [parser parse];
  NSError *parseError = [parser parserError];
  if (parseError) {
	  NSLog(@"parse error = %@", parseError);
  }
  [parser release];
  [pool drain];
  return success;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
  [(id)[self delegate] performSelectorOnMainThread:@selector(parserFinished)
                                        withObject:nil
                                     waitUntilDone:NO];
  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
  [self autorelease];
}

/*
 Sample entry
  <entry>
    <id>urn:earthquake-usgs-gov:us:2008rkbc</id>
    <title>M 5.8, Banda Sea</title>
    <updated>2008-04-29T19:10:01Z</updated>
    <link rel="alternate" type="text/html" href="/eqcenter/recenteqsww/Quakes/us2008rkbc.php"/>
    <link rel="related" type="application/cap+xml" href="/eqcenter/catalogs/cap/us2008rkbc"/>
    <summary type="html">
      <img src="http://earthquake.usgs.gov/images/globes/-5_130.jpg" alt="6.102&#176;S 127.502&#176;E" align="left" hspace="20" /><p>Tuesday, April 29, 2008 19:10:01 UTC<br>Wednesday, April 30, 2008 04:10:01 AM at epicenter</p><p><strong>Depth</strong>: 395.20 km (245.57 mi)</p>
    </summary>
    <georss:point>-6.1020 127.5017</georss:point>
    <georss:elev>-395200</georss:elev>
    <category label="Age" term="Past hour"/>
  </entry>
*/

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
  if(nil != qName) {
    elementName = qName; // swap for the qName if we have a name space
  }
  
  if ([elementName isEqualToString:@"entry"]) {
    self.currentEarthquake = [[[Earthquake alloc] init] autorelease];
  } else if([elementName isEqualToString:@"link"]) {
    // ignore the related content and just grab the alternate
    if ([[attributeDict valueForKey:@"rel"] isEqualToString:@"alternate"]) {
      NSString *link = [attributeDict valueForKey:@"href"];
      self.currentEarthquake.detailsURL = 
          [NSString stringWithFormat:@"http://earthquake.usgs.gov/%@", link];
    }
  } else if([elementName isEqualToString:@"title"] || 
            [elementName isEqualToString:@"updated"] ||
            [elementName isEqualToString:@"georss:point"]) {
    self.propertyValue = [NSMutableString string];
  } else {
    self.propertyValue = nil;
  }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
  if(nil != self.propertyValue) {
    [self.propertyValue appendString:string];
  }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {     
  if (qName) {
    elementName = qName; // switch for the qName
  }
  
  if ([elementName isEqualToString:@"title"]) {
    //<title>M 5.8, Banda Sea</title>
    NSArray *components = [self.propertyValue componentsSeparatedByString:@","];
    if(components.count > 1) {
      // strip the M
      NSString *magString = [[[components objectAtIndex:0] componentsSeparatedByString:@" "] objectAtIndex:1];
      NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
      self.currentEarthquake.magnitude = [formatter numberFromString:magString];
      self.currentEarthquake.place = [components objectAtIndex:1];
      [formatter release];
    }
  } else if ([elementName isEqualToString:@"updated"]) {
    //<updated>2008-04-29T19:10:01Z</updated>
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    self.currentEarthquake.lastUpdate = [formatter dateFromString:self.propertyValue];
    [formatter release];
  } else if ([elementName isEqualToString:@"georss:point"]) {
    NSArray *comp = [self.propertyValue componentsSeparatedByString:@" "];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *latituide = [formatter numberFromString:[comp objectAtIndex:0]];
    NSNumber *longitude = [formatter numberFromString:[comp objectAtIndex:1]];
    [formatter release];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latituide.floatValue
                                                      longitude:longitude.floatValue];
    self.currentEarthquake.location = location;
    [location release];
  } else if([elementName isEqualToString:@"entry"]) {
    [(id)[self delegate] performSelectorOnMainThread:@selector(addEarthquake:)
                                          withObject:self.currentEarthquake
                                       waitUntilDone:NO];
  }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
  if(parseError.code != NSXMLParserDelegateAbortedParseError) {
    NSLog(@"parser error %@, userInfo %@", parseError, [parseError userInfo]);
  }
}

- (void) dealloc {
  self.currentEarthquake = nil;
  self.propertyValue = nil;
  self.delegate = nil;
  [super dealloc];
}


@end
