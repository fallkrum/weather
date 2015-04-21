//
//  Forecast.h
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Root.h"

@class Main, Weather, Wind;

@interface Forecast : Root

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * locationId;
@property (nonatomic, retain) Main *main;
@property (nonatomic, retain) Weather *weather;
@property (nonatomic, retain) Wind *wind;

@end
