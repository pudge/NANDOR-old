//
//  Control.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.31.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "Control.h"
#import "URLSession.h"

@interface Control ()

@property (strong, nonatomic) URLSession *session;

@end

@implementation Control

static NSString *baseURL = @"http://XXX:YYY@ZZZ/cgi-bin/horn2.cgi";
static NSString *baseParams = @"ajax=1&style=old";

-(void)playTrack:(NSString *)name isQuiet:(BOOL)isQuiet {
    NSMutableString *params = [[NSMutableString alloc] initWithString:baseParams];
    [params appendFormat:@"&quiet=%d", isQuiet ? 1 : 0];
    [params appendString:@"&horn=dirty"];
    [params appendFormat:@"&song=%@", name];
    [self.session makeRequest:baseURL with:params];
}

-(void)playHorn:(BOOL)play withTeam:(NSString *)team isQuiet:(BOOL)isQuiet {
    NSMutableString *params = [[NSMutableString alloc] initWithString:baseParams];
    [params appendFormat:@"&%@=1", team];
    [params appendFormat:@"&quiet=%d", isQuiet ? 1 : 0];
    [params appendString:@"&horn=on"];
    [self.session makeRequest:baseURL with:params];
}

-(void)stop {
    [self.session makeRequest:baseURL with:@"horn=off"];
}


- (URLSession *)session {
    if (!_session) _session = [[URLSession alloc] init];
    return _session;
}


@end
