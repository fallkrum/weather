//
//  ForecastsViewController.m
//  weather
//
//  Created by Ilya Bukonkin on 4/16/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "ForecastsViewController.h"
#import "ForecastDetailsViewController.h"
#import "FiveDayForecastRequest.h"
#import "SyncManager.h"
#import "AppDelegate.h"
#import "ForecastCell.h"


@implementation ForecastsViewController

@synthesize longitude;
@synthesize latitude;


- (NSFetchedResultsController *)fetchResultsController {
    FetchRequest *request =
    [[LocationRequest alloc] initWithLongitude:longitude andLatitude:latitude];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *fetchRequest =
    [request requestForManagedObjectContext:delegate.managedObjectContext];
    
    NSFetchedResultsController *controller =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:delegate.managedObjectContext
                                          sectionNameKeyPath:nil
                                                   cacheName:nil];
    controller.delegate = self;

    return controller;
}


- (void)hideStateLabelAnimated:(BOOL)hide {
    float alpha = hide ^ 1;
    
    [UIView animateWithDuration:0.5
                          delay:1
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                stateLabel.alpha = alpha;
     } completion:^(BOOL finished) {
             
    }];
    
}

- (void)setStateLabelForState:(enum ForecastViewControllerState)_state {
    state = _state;
    
    switch (_state) {
        case ForecastViewControllerStateSynchronizing: {
            stateLabel.text = @"Synchronizing";
            stateLabel.alpha = 1.0;
        } break;
            
            
        case ForecastViewControllerSynchronized: {
            stateLabel.text = @"Synchronized";
            [self hideStateLabelAnimated:YES];
        } break;
            
        case ForecastViewControllerFailedToSynchronize: {
            stateLabel.text = @"Failed";
            
            if([fetchController.fetchedObjects firstObject])
                [self hideStateLabelAnimated:YES];
        }
    }
}

- (id)initWithLongitude:(NSNumber *)_longitude andLatitude:(NSNumber *)_latitude {
    self = [self init];
    
    longitude = _longitude;
    latitude = _latitude;
    
    fetchController = [self fetchResultsController];
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    if(!fetchController) fetchController = [self fetchResultsController];
    
    NSError *error = nil;
    [fetchController performFetch:&error];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if(state == ForecastViewControllerStateSynchronizing) return;
    [self setStateLabelForState:ForecastViewControllerStateSynchronizing];
    
    NetworkRequest *request =
    [[FiveDayForecastRequest alloc] initWithLongitude:longitude
                                          andLatitude:latitude];
    request.delegate = self;
    [request start];

}


- (void)finishedSync:(BOOL)success {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    
    state = ForecastViewControllerSynchronized;
    if(!success) state = ForecastViewControllerFailedToSynchronize;
    
    [self setStateLabelForState:state];
    
    Location *location = [fetchController.fetchedObjects firstObject];
    [delegate.managedObjectContext refreshObject:location mergeChanges:YES];
}



#pragma mark - NSFetchedResultsController delegate
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [tableView reloadData];
}



#pragma mark - UITableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Location *location = [fetchController.fetchedObjects firstObject];
    NSArray *forecasts = location.forecasts;
    
    return [forecasts count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForecastCell"];
    
    if(!cell)
        cell =
        [[[NSBundle mainBundle] loadNibNamed:@"ForecastCell" owner:nil options:nil]
         firstObject];
    
    Location *location = [fetchController.fetchedObjects firstObject];
    Forecast *forecast = [location.forecasts objectAtIndex:indexPath.row];
    
    [cell setData:forecast];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Location *location = [fetchController.fetchedObjects firstObject];
    Forecast *forecast = [location.forecasts objectAtIndex:indexPath.row];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ForecastDetailsViewController *controller =
    [storyBoard instantiateViewControllerWithIdentifier:@"ForecastDetailsViewController"];
    controller.forecast = forecast;
    
    [self.navigationController pushViewController:controller animated:YES];
    
}

#pragma mark - NetworkRequest delegate
- (void)networkRequestDidFinishLoading:(NetworkRequest *)request {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = delegate.privateObjectContext;
    
    __weak ForecastsViewController *wself = self;
    
    [context performBlock:^{
        
        BOOL success =
        [SyncManager syncLocationNetworkRequest:request inContext:context];

        
        NSError *error = nil;
        [context save:&error];
        [context reset];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [wself finishedSync:success];
        });
        
    }];
}


- (void)networkRequestDidFail:(NetworkRequest *)request {
    [self setStateLabelForState:ForecastViewControllerFailedToSynchronize];

}


@end
