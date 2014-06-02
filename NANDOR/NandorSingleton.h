//
//  NandorSingleton.h
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.31.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NandorSingleton : NSObject

+(id)sharedData;
@property (nonatomic) BOOL hornQuiet;
@property (nonatomic) NSUInteger teamIndex;
@property (nonatomic, strong) NSString *song;

@end
