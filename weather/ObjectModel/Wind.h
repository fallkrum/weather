//
//  Wind.h
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Root.h"

@class Forecast;

@interface Wind : Root

@property (nonatomic, retain) NSNumber * deg;
@property (nonatomic, retain) NSNumber * speed;
@property (nonatomic, retain) Forecast *forecast;

@end
