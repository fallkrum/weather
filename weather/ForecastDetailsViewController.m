//
//  ForecastDetailsViewController.m
//  weather
//
//  Created by Ilya Bukonkin on 4/19/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "ForecastDetailsViewController.h"

@interface ForecastDetailsViewController ()

@end

@implementation ForecastDetailsViewController

@synthesize forecast;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    detailsView =
    [[[NSBundle mainBundle] loadNibNamed:@"ForecastDetailsView" owner:nil options:nil]
     firstObject];
    
    NSInteger weatherState = [forecast.weather.main integerValue];
    
    switch (weatherState) {
        case WeatherGeneralStateClear:
            weatherImage = [UIImage imageNamed:@"sunny"]; break;
        case WeatherGeneralStateClouds:
            weatherImage = [UIImage imageNamed:@"cloudy"]; break;
        case WeatherGeneralStateRain:
            weatherImage = [UIImage imageNamed:@"rain"];
    }
    
    [scrollView addSubview:detailsView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    detailsView.imageView.image = weatherImage;
    [detailsView setData:forecast];
}


- (void)layoutSubviews {
    detailsView.frame = CGRectMake(0,
                                   0,
                                   scrollView.bounds.size.width,
                                   detailsView.bounds.size.height);
    scrollView.contentSize =
    CGSizeMake(0, detailsView.bounds.size.height);    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self layoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self layoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
