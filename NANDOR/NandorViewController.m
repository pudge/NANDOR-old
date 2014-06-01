//
//  NandorViewController.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.30.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "NandorViewController.h"
#import "Teams.h"
#import "Control.h"

@interface NandorViewController ()

@property (weak, nonatomic) IBOutlet UIButton *hornButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *teamSegment;

@property (nonatomic) NSUInteger logLevel;
@property (nonatomic) BOOL hornQuiet;

@property (strong, nonatomic) Control *control;
@property (strong, nonatomic) Teams *teams;
@property (strong, nonatomic) Team *team;

@end


@implementation NandorViewController

- (void)setTeam {
    self.team = [self.teams getTeamByIndex:self.teamSegment.selectedSegmentIndex];
}

- (IBAction)pressHornButton:(UIButton *)sender {
    [self setTeam];
    [self.control playHorn:true withTeam:self.team.shortname isQuiet:self.hornQuiet];
}

- (IBAction)changeTeam:(UISegmentedControl *)sender {
    [self setTeam];
    [self.hornButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-button", self.team.shortname]]
                               forState:UIControlStateNormal];
    self.view.backgroundColor = self.team.color;
}

- (IBAction)editHorn:(UIBarButtonItem *)sender {
    // show edit sheet
}

- (IBAction)winHorn:(UIBarButtonItem *)sender {
    [self.control playTrack:@"dirty" isQuiet:self.hornQuiet];
}

- (IBAction)offHorn:(UIBarButtonItem *)sender {
    [self.control stop];
}

//////////////////////////////////////////////////////
// Helper methods

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (Control *)control {
    if (!_control) _control = [[Control alloc] init];
    return _control;
}

- (Teams *)teams {
    if (!_teams)  _teams = [[Teams alloc] init];
    return _teams;
}

// TBD: fix later
- (BOOL)hornQuiet {
    return false;
}


@end


