//
//  NandorSingleton.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.31.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "NandorSingleton.h"

@implementation NandorSingleton

static NandorSingleton *_sharedData;
NSUserDefaults *defaults;

static BOOL _hornQuiet;
static NSUInteger _teamIndex;

+(NandorSingleton *)sharedData {
    if (!_sharedData) _sharedData = [[NandorSingleton alloc] init];
    return _sharedData;
}

-(NandorSingleton *)init {
    defaults = [NSUserDefaults standardUserDefaults];

    _hornQuiet = [[defaults valueForKey:@"hornQuiet"] boolValue];
    _teamIndex = [[defaults valueForKey:@"teamIndex"] unsignedIntegerValue];

    return self;
}



-(BOOL)hornQuiet { return _hornQuiet; }
-(void)setHornQuiet:(BOOL)hornQuiet {
    _hornQuiet = hornQuiet;
    [defaults setValue:[NSNumber numberWithBool:_hornQuiet]
                forKey:@"hornQuiet"];
    [defaults synchronize];
}

-(NSUInteger)teamIndex { return _teamIndex; }
-(void)setTeamIndex:(NSUInteger)teamIndex {
    _teamIndex = teamIndex;
    [defaults setValue:[NSNumber numberWithUnsignedInteger:_teamIndex]
                forKey:@"teamIndex"];
    [defaults synchronize];
}


@end
