//
//  FetchRequest.h
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface FetchRequest : NSObject {
@protected
    NSString                        *entityName;
    NSPredicate                     *predicate;
    NSArray                         *sortDescriptors;
    NSInteger                       batchSize;
    NSError                         *error;
}

@property (nonatomic, readonly) NSError *error;

- (id)executeInContext:(NSManagedObjectContext *)context;
- (NSFetchRequest *)requestForManagedObjectContext:(NSManagedObjectContext *)context;

@end
