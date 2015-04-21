//
//  ForecastRequest.m
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "ForecastRequest.h"

@implementation ForecastRequest

- (id)init {
    self = [super init];
    
    entityName = @"Forecast";
    
    return self;
}


- (id)initWithLocationId:(NSNumber *)iD andDate:(NSDate *)date {
    self = [self init];
    
    predicate =
    [NSPredicate predicateWithFormat:@"(locationId == %@) && (date >= %@)", iD, date];
    
    return self;
}

- (id)initWithLocationId:(NSNumber *)iD {
    self = [self init];
    
    predicate = [NSPredicate predicateWithFormat:@"(locationId == %@)", iD];
    
    return self;

}

@end
