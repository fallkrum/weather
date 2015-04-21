//
//  Root.m
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "Root.h"
#import <objc/runtime.h>

@implementation Root

+ (Root *)newEntityInContext:(NSManagedObjectContext *)context {

    const char *class_name = class_getName([self class]);
    NSString *className = [NSString stringWithCString:class_name
                                             encoding:NSUTF8StringEncoding];
    
    Root *entity = [NSEntityDescription insertNewObjectForEntityForName: className
                                                 inManagedObjectContext:context];
    
    return entity;
}

+ (void)initFetchedPropertiesInObjectModel:(NSManagedObjectModel *)model {
    
}

- (void)setDataFromDictionary:(NSDictionary *)dictionary {
    
}

@end
