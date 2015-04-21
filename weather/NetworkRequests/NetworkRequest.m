//
//  NetworkRequest.m
//  weather
//
//  Created by Ilya Bukonkin on 4/15/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest

@synthesize delegate;
@synthesize completionThread;
@synthesize data;
@synthesize error;
@synthesize params;

- (void)setCompletionData:(id)_data {
    data = _data;
}

- (void)setCompletionError:(NSError *)_error {
    error = _error;
}

- (BOOL)isStarted {
    if(completionThread) return YES;
    
    OSSpinLockLock(&spinLock);
    
    if(completionThread) {
        OSSpinLockUnlock(&spinLock);
        return YES;
    }
    
    completionThread = [NSThread currentThread];
    
    OSSpinLockUnlock(&spinLock);
    
    return NO;
}

- (void)start {
    if([self isStarted]) return;
    
    operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    NetworkRequest *wself = self;
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [wself setCompletionData:responseObject];
        
        __weak id observer = wself.delegate;
        
        [observer performSelector:@selector(networkRequestDidFinishLoading:)
                        onThread:[wself completionThread]
                       withObject:wself
                    waitUntilDone:NO];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *_error) {
        [wself setCompletionError:_error];
        
        __weak id observer = wself.delegate;
        
        [observer performSelector:@selector(networkRequestDidFail:)
                         onThread:[wself completionThread]
                       withObject:wself
                    waitUntilDone:NO];
    }];
    
    [operation start];
}


- (void)cancel {
    [operation cancel];
}


- (void)dealloc {
    
}

@end
