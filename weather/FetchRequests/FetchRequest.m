//
//  FetchRequest.m
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "FetchRequest.h"
#import <CoreData/CoreData.h>

@implementation FetchRequest

@synthesize error;

- (id)init {
    self = [super init];
    
    batchSize = 20;
    sortDescriptors = @[];
    
    return self;
}

- (id)executeInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [self requestForManagedObjectContext:context];
    
    NSError *requestError = nil;
    
    id result = [context executeFetchRequest:request error:&requestError];
    error = requestError;

    return result;
}

- (NSFetchRequest *)requestForManagedObjectContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entityDescription =
    [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
    [request setEntity:entityDescription];
    [request setPredicate: predicate];
    [request setSortDescriptors:sortDescriptors];
    [request setFetchBatchSize:batchSize];
    
    return request;
}

@end
