//
//  SyncManager.m
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "SyncManager.h"

@implementation SyncManager

+ (NSDate *)ddMMyyyyDateFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [formatter stringFromDate:date];
    
    return [formatter dateFromString:dateString];
}

+ (BOOL)syncLocationNetworkRequest:(NetworkRequest*)request
                         inContext:(NSManagedObjectContext *)context {
    
    NSString *codeString = [request.data objectForKey:@"cod"];
    if(!codeString ||
       [codeString isEqualToString:@""] ||
       [codeString integerValue] != 200) return NO;
    
    
    FetchRequest *fetchRequest =
    [[LocationRequest alloc] initWithLongitude:request.params[0]
                                   andLatitude:request.params[1]];
    
    Location *location = [[fetchRequest executeInContext:context] firstObject];
    
    NSDictionary *dictionary = [request.data objectForKey:@"city"];
    
    if(!dictionary) return NO;
    if(!location) location = [Location newEntityInContext:context];
    
    location.longitude = request.params[0];
    location.latitude = request.params[1];
    [location setDataFromDictionary:dictionary];
    
    NSArray *dictionaries = [request.data objectForKey:@"list"];
    if(!dictionaries) return NO;
      
    fetchRequest = [[ForecastRequest alloc] initWithLocationId:location.iD];
    
    NSArray *forecasts = [fetchRequest executeInContext:context];
    for (Forecast *forecast in forecasts) [context deleteObject:forecast];
    
  
    for (dictionary in dictionaries) {
        Forecast *forecast = [Forecast newEntityInContext:context];
        forecast.locationId = location.iD;
        [forecast setDataFromDictionary:dictionary];
    }
    
    return YES;
}

@end
