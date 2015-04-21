//
//  SyncManager.h
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectModel.h"
#import "FetchRequests.h"
#import "NetworkRequest.h"


@interface SyncManager : NSObject
+ (BOOL)syncLocationNetworkRequest:(NetworkRequest*)request
                         inContext:(NSManagedObjectContext *)context;
@end
