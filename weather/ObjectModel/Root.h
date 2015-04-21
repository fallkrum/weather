//
//  Root.h
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Root : NSManagedObject

+ (Root *)newEntityInContext:(NSManagedObjectContext *)context;
+ (void)initFetchedPropertiesInObjectModel:(NSManagedObjectModel *)model;
- (void)setDataFromDictionary:(NSDictionary *)dictionary;

@end
