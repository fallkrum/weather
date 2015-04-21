//
//  ForecastDetailsViewController.h
//  weather
//
//  Created by Ilya Bukonkin on 4/19/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastDetailsView.h"

@interface ForecastDetailsViewController : UIViewController {
@protected
    ForecastDetailsView                *detailsView;
    UIImage                             *weatherImage;
    __weak IBOutlet UIScrollView        *scrollView;
}
@property (nonatomic, strong) Forecast  *forecast;
@end
