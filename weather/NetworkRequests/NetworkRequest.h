//
//  NetworkRequest.h
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libkern/OSAtomic.h>
#import "AFNetworking.h"

@class NetworkRequest;

@protocol NetworkRequestDelegate <NSObject>
- (void)networkRequestDidFinishLoading:(NetworkRequest *)request;
- (void)networkRequestDidFail:(NetworkRequest *)request;
@end

@interface NetworkRequest : NSObject {
@private
    id                                      data;
    NSError                                 *error;
    __weak id <NetworkRequestDelegate>      delegate;
    NSThread                                *completionThread;
    AFHTTPRequestOperation                  *operation;
    volatile OSSpinLock                     spinLock;
    
@protected
    NSURLRequest                            *request;
    NSArray                                 *params;
}

@property (nonatomic, weak) id <NetworkRequestDelegate> delegate;
@property (nonatomic, readonly) NSThread *completionThread;
@property (nonatomic, readonly) id data;
@property (nonatomic, readonly) NSError *error;
@property (nonatomic, readonly) NSArray *params;

- (void)start;
- (void)cancel;

@end
