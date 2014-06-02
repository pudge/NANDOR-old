//
//  URLSession.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.31.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "URLSession.h"

@interface URLSession ()

@property (strong, nonatomic) NSURLSessionConfiguration *configuration;
@property (strong, nonatomic) NSURLSession *session;
@property (nonatomic) BOOL inited;

@end


@implementation URLSession

- (instancetype)init {
    [self initSession];
    return self;
}

- (void)initSession {
    if (self.inited) {
        return;
    }
    self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:self.configuration];
    self.inited = true;
    return;
}

- (void)makeRequest:(NSString *)baseURL with:(NSString *)params {
    //NSLog(@"URL: %@?%@", baseURL, params);
    //return;

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", baseURL, params]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    }];
    [dataTask resume];
}

@end
