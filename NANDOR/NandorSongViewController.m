//
//  NandorSongsViewController.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.06.01.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "NandorSongViewController.h"
#import "NandorSingleton.h"
#import "Tracks.h"
#import "Track.h"
#import "Control.h"

@interface NandorSongViewController ()

@property (strong, nonatomic) Control *control;
@property (strong, nonatomic) Tracks *tracks;

@end

static NandorSingleton *_sharedData;

@implementation NandorSongViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    Track *track = [self.tracks getTrackByIndex:indexPath.row];
    cell.textLabel.text = track.name;
    cell.detailTextLabel.text = track.shortname;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Track *track = [self.tracks getTrackByIndex:indexPath.row];
    self.sharedData.song = track.shortname;

    [self.control playTrack:track.shortname isQuiet:self.sharedData.hornQuiet];

    [self performSegueWithIdentifier:@"unwindToRootController" sender:self];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tracks trackCount];
}

- (NandorSingleton *)sharedData {
    if (!_sharedData) _sharedData = [NandorSingleton sharedData];
    return _sharedData;
}

- (Control *)control {
    if (!_control) _control = [[Control alloc] init];
    return _control;
}

- (Tracks *)tracks {
    if (!_tracks)  _tracks = [[Tracks alloc] init];
    return _tracks;
}


@end
