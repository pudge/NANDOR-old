//
//  Tracks.h
//  NANDOR
//
//  Created by Chris Nandor on 2014.06.01.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

@interface Tracks : NSObject

@property (nonatomic) NSUInteger trackCount;
- (Track *)getTrackByIndex:(NSUInteger)idx;

@end
