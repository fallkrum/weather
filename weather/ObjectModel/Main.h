//
//  Main.h
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Root.h"


@class Forecast;

@interface Main : Root

@property (nonatomic, retain) NSNumber * groundLevel;
@property (nonatomic, retain) NSNumber * humidity;
@property (nonatomic, retain) NSNumber * pressure;
@property (nonatomic, retain) NSNumber * seaLevel;
@property (nonatomic, retain) NSNumber * temperature;
@property (nonatomic, retain) NSNumber * temperatureMax;
@property (nonatomic, retain) NSNumber * temperatureMin;
@property (nonatomic, retain) Forecast *forecast;

@end
