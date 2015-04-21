//
//  Wind.m
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Wind.h"
#import "Forecast.h"


@implementation Wind

@dynamic deg;
@dynamic speed;
@dynamic forecast;

- (void)setDataFromDictionary:(NSDictionary *)dictionary {
    float floatValue = [[dictionary valueForKey:@"speed"] floatValue];
    self.speed = [NSNumber numberWithFloat:floatValue];
    
    floatValue = [[dictionary valueForKey:@"deg"] floatValue];
    self.deg = [NSNumber numberWithFloat:floatValue];
}

@end
