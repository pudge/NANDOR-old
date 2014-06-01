//
//  Teams.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.31.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "Teams.h"
#import "Team.h"

@interface Teams()

@property (strong, nonatomic) NSMutableArray *teams;

@end


@implementation Teams

- (instancetype)init {
    [self initTeams];
    return self;
}

- (Team *)getTeamByIndex:(NSUInteger)idx {
    return self.teams[idx];
}

- (void)initTeams {
    Team *bruins = [[Team alloc] init];
    bruins.shortname = @"bruins";
    bruins.label = @"Bruins";
    bruins.name = @"Boston Bruins";
    bruins.color = [UIColor blackColor];
    
    Team *patriots = [[Team alloc] init];
    patriots.shortname = @"patriots";
    patriots.label = @"Patriots";
    patriots.name = @"New England Patriots";
    patriots.color = [UIColor colorWithRed:0.04296875 green:0.13671875 blue:0.3046875 alpha:1]; // 11, 35, 78
    
    Team *redsox = [[Team alloc] init];
    redsox.shortname = @"redsox";
    redsox.label = @"Red Sox";
    redsox.name = @"Boston Red Sox";
    redsox.color = [UIColor colorWithRed:0.09765625 green:0.20703125 blue:0.32421875 alpha:1]; // 25, 53, 83
    
    Team *celtics = [[Team alloc] init];
    celtics.shortname = @"celtics";
    celtics.label = @"Celtics";
    celtics.name = @"Boston Celtics";
    celtics.color = [UIColor colorWithRed:0 green:0.515625 blue:0.27734375 alpha:1]; // 0, 132, 71
    
    Team *usa = [[Team alloc] init];
    usa.shortname = @"usa";
    usa.label = @"USA";
    usa.name = @"USA";
    usa.color = [UIColor colorWithRed:0.0390625 green:0.0625 blue:0.33984375 alpha:1]; // 10, 16, 87
    
    _teams = [NSMutableArray arrayWithObjects:
              patriots, redsox, bruins, celtics, usa,
              nil];
}

@end
