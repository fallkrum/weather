//
//  Location.m
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Location.h"


@implementation Location

@dynamic iD;
@dynamic latitude;
@dynamic longitude;
@dynamic forecasts;


+ (void)initFetchedPropertiesInObjectModel:(NSManagedObjectModel *)model {
    
    NSEntityDescription *entityDescription = model.entitiesByName[@"Location"];
    
    NSFetchedPropertyDescription *fetechedPropertyDescription =
    entityDescription.propertiesByName[@"forecasts"];
    
    
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"locationId == $FETCH_SOURCE.iD"];
    [fetechedPropertyDescription.fetchRequest setPredicate:predicate];
    
    NSSortDescriptor *sortDescriptor =
    [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    [fetechedPropertyDescription.fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    [fetechedPropertyDescription.fetchRequest setFetchBatchSize:20];
}

- (void)setDataFromDictionary:(NSDictionary *)dictionary {
    self.iD = [dictionary objectForKey:@"id"];
}

@end
