//
//  FiveDayForecastRequest.h
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "NetworkRequest.h"

@interface FiveDayForecastRequest : NetworkRequest

- (id)initWithLongitude:(NSNumber *)longitude andLatitude:(NSNumber *)latitude;

@end
