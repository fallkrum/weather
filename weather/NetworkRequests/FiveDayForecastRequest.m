//
//  FiveDayForecastRequest.m
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "FiveDayForecastRequest.h"

@implementation FiveDayForecastRequest

- (id)initWithLongitude:(NSNumber *)longitude andLatitude:(NSNumber *)latitude {
    self = [self init];
    
    params = @[longitude, latitude];
    
    NSString *stringUrl =
    [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast?lat=%@&lon=%@",
     latitude,
     longitude];
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    request = [NSURLRequest requestWithURL:url];
    
    return self;
}

@end
