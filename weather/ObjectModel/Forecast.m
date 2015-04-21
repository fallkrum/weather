//
//  Forecast.m
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Forecast.h"
#import "Main.h"
#import "Weather.h"
#import "Wind.h"


@implementation Forecast

@dynamic date;
@dynamic locationId;
@dynamic main;
@dynamic weather;
@dynamic wind;


- (void)setDataFromDictionary:(NSDictionary *)dictionary {
    NSInteger intValue = [[dictionary objectForKey:@"dt"] integerValue];
    
    self.date = [NSDate dateWithTimeIntervalSince1970:intValue];
    
    NSDictionary *dictionaryValue = [dictionary objectForKey:@"main"];
    if(dictionaryValue) {
        self.main = [Main newEntityInContext:self.managedObjectContext];
        [self.main setDataFromDictionary:dictionaryValue];
    }
    
    
    dictionaryValue = [[dictionary objectForKey:@"weather"] firstObject];
    if(dictionaryValue) {
        self.weather = [Weather newEntityInContext:self.managedObjectContext];
        [self.weather setDataFromDictionary:dictionaryValue];
    }
    
    dictionaryValue = [dictionary objectForKey:@"wind"];
    if(dictionaryValue) {
        self.wind = [Wind newEntityInContext:self.managedObjectContext];
        [self.wind setDataFromDictionary:dictionaryValue];
    }
}

@end
