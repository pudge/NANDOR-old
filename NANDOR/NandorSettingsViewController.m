//
//  NandorSettingsViewController.m
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.31.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import "NandorSettingsViewController.h"
#import "NANDOR-Swift.h"

@interface NandorSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *quietSwitch;

@end

static NandorSingleton *_sharedData;

@implementation NandorSettingsViewController

- (void)loadView {
    [super loadView];

    if (self.sharedData.hornQuiet) {
        [self.quietSwitch setOn:true];
    }
}


- (IBAction)switchQuiet:(UISwitch *)sender {
    self.sharedData.hornQuiet = self.quietSwitch.isOn;
}

- (NandorSingleton *)sharedData {
    if (!_sharedData) _sharedData = [[NandorSingleton alloc] init];
    return _sharedData;
}



@end
