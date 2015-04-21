//
//  ForecastDetailsView.m
//  weather
//
//  Created by Ilya Bukonkin on 4/19/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "ForecastDetailsView.h"

@implementation ForecastDetailsView

@synthesize imageView;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)setData:(Forecast *)forecast {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy h:m a"];
    
    NSString *dateString = [formatter stringFromDate:forecast.date];
    dateLabel.text = dateString;
    
    temperatureLabel.text =
    [NSString stringWithFormat:@"%@", forecast.main.temperature];
    temperatureMinLabel.text =
    [NSString stringWithFormat:@"%@", forecast.main.temperatureMin];
    temperatureMaxLabel.text =
    [NSString stringWithFormat:@"%@", forecast.main.temperatureMax];
    pressureLabel.text =
    [NSString stringWithFormat:@"%@", forecast.main.pressure];
    seaLevelLabel.text =
    [NSString stringWithFormat:@"%@", forecast.main.seaLevel];
    groundLevelLabel.text =
    [NSString stringWithFormat:@"%@", forecast.main.groundLevel];
    humidityLabel.text =
    [NSString stringWithFormat:@"%@", forecast.main.humidity];
    
    windSpeedLabel.text =
    [NSString stringWithFormat:@"%@", forecast.wind.speed];
    windDegLabel.text =
    [NSString stringWithFormat:@"%@", forecast.wind.deg];
}

@end
