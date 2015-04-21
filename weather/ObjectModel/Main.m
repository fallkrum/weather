//
//  Main.m
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Main.h"
#import "Forecast.h"


@implementation Main

@dynamic groundLevel;
@dynamic humidity;
@dynamic pressure;
@dynamic seaLevel;
@dynamic temperature;
@dynamic temperatureMax;
@dynamic temperatureMin;
@dynamic forecast;

- (void)setDataFromDictionary:(NSDictionary *)dictionary {
    float floatValue = [[dictionary objectForKey:@"temp"] floatValue];
    self.temperature = [NSNumber numberWithFloat:floatValue];
    
    floatValue = [[dictionary objectForKey:@"temp_min"] floatValue];
    self.temperatureMin = [NSNumber numberWithFloat:floatValue];
    
    floatValue = [[dictionary objectForKey:@"temp_max"] floatValue];
    self.temperatureMax = [NSNumber numberWithFloat:floatValue];
    
    floatValue = [[dictionary objectForKey:@"pressure"] floatValue];
    self.pressure = [NSNumber numberWithFloat:floatValue];
    
    floatValue = [[dictionary objectForKey:@"sea_level"] floatValue];
    self.seaLevel = [NSNumber numberWithFloat:floatValue];
    
    floatValue = [[dictionary objectForKey:@"grnd_level"] floatValue];
    self.groundLevel = [NSNumber numberWithFloat:floatValue];
    
    floatValue = [[dictionary objectForKey:@"humidity"] floatValue];
    self.humidity = [NSNumber numberWithFloat:floatValue];
}

@end
