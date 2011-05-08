//
//  EarthquakeParser.h
//  MapQuakes
//
//  Created by Bill Dudney on 6/19/09.
//  Copyright 2009 Gala Factory Software LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Earthquake;
@protocol EarthquakeParserDelegate;

@interface EarthquakeParser : NSObject {
  Earthquake *_currentEarthquake;
  NSMutableString *_propertyValue;
  id<EarthquakeParserDelegate> _delegate;
  NSOperationQueue *_retrieverQueue;
}

+ (id)earthquakeParser;

@property(nonatomic, retain) Earthquake *currentEarthquake;
@property(nonatomic, retain) NSMutableString *propertyValue;
@property(nonatomic, assign) id<EarthquakeParserDelegate> delegate;
@property(nonatomic, retain) NSOperationQueue *retrieverQueue;

- (void)getEarthquakeData;

@end

@protocol EarthquakeParserDelegate <NSObject>

- (void)addEarthquake:(Earthquake *)earthquake;
- (void)parserFinished;

@end

