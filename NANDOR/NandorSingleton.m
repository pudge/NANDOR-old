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
static NSString *sharedDictPath;
static NSMutableDictionary *sharedDict;
static BOOL _hornQuiet = false;

+(NandorSingleton *)sharedData {
    if (!_sharedData) _sharedData = [[NandorSingleton alloc] init];
    return _sharedData;
}

-(NandorSingleton *)init {
//    sharedDictPath = [[NSBundle mainBundle] pathForResource:@"sharedData"
//                                                     ofType:@"plist"];
//    sharedDict = [[NSMutableDictionary alloc] initWithContentsOfFile:sharedDictPath];

    sharedDict = [[NSMutableDictionary alloc] init];
    _hornQuiet = [[sharedDict valueForKey:@"hornQuiet"] boolValue];

    return self;
}

-(BOOL)hornQuiet {
    return _hornQuiet;
}

-(void)setHornQuiet:(BOOL)hornQuiet {
    _hornQuiet = hornQuiet;
    [sharedDict setValue:[NSNumber numberWithBool:_hornQuiet]
                  forKey:@"hornQuiet"];
//    [sharedDict writeToFile:sharedDictPath atomically:YES];
}


@end
