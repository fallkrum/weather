//
//  Weather.m
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Weather.h"
#import "Forecast.h"


@implementation Weather

@dynamic descr;
@dynamic icon;
@dynamic iD;
@dynamic main;
@dynamic forecast;


- (NSNumber *)weatherStateNumberWithString:(NSString *)string {
    NSInteger value = WeatherGeneralStateClear;
    
    if([string isEqualToString:@"Clouds"]) value = WeatherGeneralStateClouds;
    else if ([string isEqualToString:@"Rain"]) value = WeatherGeneralStateRain;
    
    
    return [NSNumber numberWithInteger:value];
}


- (void)setDataFromDictionary:(NSDictionary *)dictionary {
    NSInteger integerValue = [[dictionary valueForKey:@"id"] integerValue];
    self.iD = [NSNumber numberWithInteger:integerValue];
    
    NSString *stringValue = [dictionary objectForKey:@"main"];
    if(stringValue)
        self.main = [self weatherStateNumberWithString:stringValue];
    
    self.descr = [dictionary objectForKey:@"description"];
}

@end
