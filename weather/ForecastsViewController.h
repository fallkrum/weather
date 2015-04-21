//
//  ForecastsViewController.h
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkRequest.h"
#import <CoreData/CoreData.h>

enum ForecastViewControllerState {
    ForecastViewControllerSynchronized,
    ForecastViewControllerStateSynchronizing,
    ForecastViewControllerFailedToSynchronize
};

@interface ForecastsViewController : UIViewController
<NetworkRequestDelegate, NSFetchedResultsControllerDelegate, UITableViewDelegate,
UITableViewDataSource> {
@private
    NSNumber                            *latitude;
    NSNumber                            *longitude;
    NSFetchedResultsController          *fetchController;
    __weak IBOutlet UITableView         *tableView;
    __weak IBOutlet UILabel             *stateLabel;
    enum ForecastViewControllerState    state;
}

@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

- (id)initWithLongitude:(NSNumber *)longitude andLatitude:(NSNumber *)latitude;

@end
