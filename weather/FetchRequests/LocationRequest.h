//
//  LocationRequest.h
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "FetchRequest.h"

@interface LocationRequest : FetchRequest
- (id)initWithLongitude:(NSNumber *)longitude andLatitude:(NSNumber *)latitude;
- (id)initWithLocationId:(NSNumber *)iD;
@end
