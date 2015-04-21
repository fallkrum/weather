//
//  ForecastCell.h
//  weather
//
//  Created by Ilya Bukonkin on 4/18/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "RootCell.h"

@interface ForecastCell : RootCell {
@private
    __weak IBOutlet UILabel             *dateLabel;
    __weak IBOutlet UILabel             *temperatureLabel;
}

@property (nonatomic, readonly) UILabel *dateLabel;
@property (nonatomic, readonly) UILabel *temperatureLabel;

@end
