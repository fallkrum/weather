//
//  ForecastRequest.h
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "FetchRequest.h"

@interface ForecastRequest : FetchRequest
- (id)initWithLocationId:(NSNumber *)iD andDate:(NSDate *)date;
- (id)initWithLocationId:(NSNumber *)iD;
@end
