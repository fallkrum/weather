//
//  ForecastDetailsView.h
//  weather
//
//  Created by Ilya Bukonkin on 4/19/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectModel.h"

@interface ForecastDetailsView : UIView {
@private
    __weak IBOutlet UILabel     *dateLabel;
    __weak IBOutlet UIImageView *imageView;
    
    __weak IBOutlet UILabel     *temperatureLabel;
    __weak IBOutlet UILabel     *temperatureMinLabel;
    __weak IBOutlet UILabel     *temperatureMaxLabel;
    __weak IBOutlet UILabel     *pressureLabel;
    __weak IBOutlet UILabel     *seaLevelLabel;
    __weak IBOutlet UILabel     *groundLevelLabel;
    __weak IBOutlet UILabel     *humidityLabel;
    
    __weak IBOutlet UILabel     *windSpeedLabel;
    __weak IBOutlet UILabel     *windDegLabel;
}

@property (nonatomic, readonly) UIImageView *imageView;
- (void)setData:(Forecast *)forecast;

@end
