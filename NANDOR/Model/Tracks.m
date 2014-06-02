//
//  Tracks.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.06.01.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "Tracks.h"

@interface Tracks ()

@property (strong, nonatomic) NSMutableArray *tracks;

@end

@implementation Tracks

- (instancetype)init {
    [self initTracks];
    return self;
}

- (NSUInteger)trackCount {
    return [self.tracks count];
}

- (Track *)getTrackByIndex:(NSUInteger)idx {
    return self.tracks[idx];
}

- (void)initTracks {
    Track *shippingup = [[Track alloc] init];
    shippingup.name = @"I'm Shipping Up to Boston";
    shippingup.shortname = @"shippingup";
    
    Track *crazytrain = [[Track alloc] init];
    crazytrain.name = @"Crazy Train";
    crazytrain.shortname = @"crazytrain";
    
    Track *tessie = [[Track alloc] init];
    tessie.name = @"Tessie";
    tessie.shortname = @"tessie";
    
    Track *caroline = [[Track alloc] init];
    caroline.name = @"Caroline";
    caroline.shortname = @"caroline";
    
    Track *nutty = [[Track alloc] init];
    nutty.name = @"Nutty";
    nutty.shortname = @"nutty";
    
    Track *higher = [[Track alloc] init];
    higher.name = @"Higher and Higher";
    higher.shortname = @"higher";
    
    Track *wearechamps = [[Track alloc] init];
    wearechamps.name = @"We Are The Champions";
    wearechamps.shortname = @"wearechamps";
    
    Track *fightonice = [[Track alloc] init];
    fightonice.name = @"Fight on the Ice";
    fightonice.shortname = @"fightonice";
    
    Track *breakaway = [[Track alloc] init];
    breakaway.name = @"Breakaway";
    breakaway.shortname = @"breakaway";
    
    Track *shotscore = [[Track alloc] init];
    shotscore.name = @"Shot Score!";
    shotscore.shortname = @"shotscore";
    
    _tracks = [NSMutableArray arrayWithObjects:
              shippingup, crazytrain, tessie, caroline, nutty,
               higher, wearechamps, fightonice, breakaway, shotscore,
              nil];
}

@end
