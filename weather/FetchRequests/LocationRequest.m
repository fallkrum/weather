//
//  LocationRequest.m
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "LocationRequest.h"

@implementation LocationRequest


- (id)init {
    self = [super init];
    
    entityName = @"Location";
    
    return self;
}

- (id)initWithLongitude:(NSNumber *)longitude andLatitude:(NSNumber *)latitude {
    self = [self init];
    
    predicate =
    [NSPredicate predicateWithFormat:@"longitude == %@ && latitude == %@", longitude, latitude];
    
    return self;
}

- (id)initWithLocationId:(NSNumber *)iD {
    self = [self init];
    
    predicate = [NSPredicate predicateWithFormat:@"iD == %d", iD];
    
    return self;
}

@end
