//
//  NandorViewController.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.30.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "NandorViewController.h"

@interface NandorViewController ()
@property (weak, nonatomic) IBOutlet UIButton *hornButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *teamSegment;

@property (strong, nonatomic) NSString *teamName;
@property (strong, nonatomic) UIColor *teamColor;
@property (nonatomic) BOOL hornQuiet;

@property (strong, nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSURLCredential *sessionCredential;
@property (nonatomic) BOOL sessionInited;
@property (strong, nonatomic) NSString *baseURL;
@end

@implementation NandorViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

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
    // we could use this for posting, but i want to see the get parameters
//    NSURL *url = [NSURL URLWithString:self.baseURL];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", self.baseURL, params]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    }];
    [dataTask resume];
}

- (void)setTeam {
    switch (self.teamSegment.selectedSegmentIndex) {
        case 0:
            self.teamName = @"patriots";
            self.teamColor = [UIColor colorWithRed:0.04296875 green:0.13671875 blue:0.3046875 alpha:1]; // 11, 35, 78
            break;
        case 1:
            self.teamName = @"redsox";
            self.teamColor = [UIColor colorWithRed:0.09765625 green:0.20703125 blue:0.32421875 alpha:1]; // 25, 53, 83
            break;
        case 2:
            self.teamName = @"bruins";
            self.teamColor = [UIColor blackColor]; // 0, 0, 0
            break;
        case 3:
            self.teamName = @"celtics";
            self.teamColor = [UIColor colorWithRed:0 green:0.515625 blue:0.27734375 alpha:1]; // 0, 132, 71
            break;
        case 4:
            self.teamName = @"usa";
            self.teamColor = [UIColor colorWithRed:0.0390625 green:0.0625 blue:0.33984375 alpha:1]; // 10, 16, 87
            break;
    }
}

- (IBAction)pressHornButton:(UIButton *)sender {
    [self initSession];

    // move to a control later
    self.hornQuiet = true;

    [self setTeam];
    NSMutableString *params = [[NSMutableString alloc] initWithString:@"horn=on&style=old&ajax=1"];
    [params appendFormat:@"&%@=1", self.teamName];
    [params appendFormat:@"&quiet=%d", self.hornQuiet ? 1 : 0];

//    NSLog(@"horn params: %@", params);
    [self makeSessionRequest:params];
}


- (IBAction)changeTeam:(UISegmentedControl *)sender {
    [self setTeam];
    [self.hornButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-button", self.teamName]] forState:UIControlStateNormal];
    self.view.backgroundColor = self.teamColor;
}


- (IBAction)editHorn:(UIBarButtonItem *)sender {
    // show edit sheet
}



@end


