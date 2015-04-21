//
//  ForecastCell.m
//  weather
//
//  Created by Ilya Bukonkin on 4/18/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "ForecastCell.h"
#import "ObjectModel.h"

@implementation ForecastCell

@synthesize dateLabel;
@synthesize temperatureLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(Root *)data {
    Forecast *forecast = (Forecast *)data;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy h:m a"];
    
    NSString *dateString = [formatter stringFromDate:forecast.date];
    NSString *temperatureString =
    [NSString stringWithFormat:@"%@", forecast.main.temperature];
    
    dateLabel.text = dateString;
    temperatureLabel.text = temperatureString;
}

@end
