//
//  Teams.h
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.31.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"

@interface Teams : NSObject

- (Team *)getTeamByIndex:(NSUInteger)idx;

@end

