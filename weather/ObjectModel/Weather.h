//
//  Weather.h
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Root.h"

enum WeatherGeneralState {
    WeatherGeneralStateClear,
    WeatherGeneralStateClouds,
    WeatherGeneralStateRain
};

@class Forecast;

@interface Weather : Root

@property (nonatomic, retain) NSString * descr;
@property (nonatomic, retain) NSString * icon;
@property (nonatomic, retain) NSNumber * iD;
@property (nonatomic, retain) NSNumber * main;
@property (nonatomic, retain) Forecast *forecast;

@end
