//
//  NandorViewController.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.30.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "NandorViewController.h"

@interface NandorViewController ()
@property (strong, nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSURLCredential *sessionCredential;
@property (nonatomic) BOOL sessionInited;
@property (strong, nonatomic) NSString *baseURL;
@end

@implementation NandorViewController

- (void)initSession {
    if (self.sessionInited) {
        return;
    }
    self.sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    self.baseURL = @"http://XX:YY@ZZ/cgi-bin/horn2.cgi";
    self.sessionInited = true;
    return;
}

- (void)makeSessionRequest:(NSString *)params {
    NSURL *url = [NSURL URLWithString:self.baseURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    }];
    [dataTask resume];
}

- (IBAction)pressHornButton:(UIButton *)sender {
    [self initSession];
    [self makeSessionRequest:@"quiet=1&horn=on&style=old&ajax=1"];
}

@end


