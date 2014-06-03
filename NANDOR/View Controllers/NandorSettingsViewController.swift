//
//  NandorSettingsViewController.swift
//  NANDOR
//
//  Created by Chris Nandor on 2014.06.02.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import UIKit

class NandorSettingsViewController:UIViewController {
    //@property (weak, nonatomic) IBOutlet UISwitch *quietSwitch;
    @IBOutlet var quietSwitch:UISwitch
    var singleton = NandorSingleton()
    
//    override func loadView() {
//        super.loadView()
//        self.quietSwitch.setOn(self.singleton.hornQuiet(), animated: true)
//    }

    @IBAction func switchQuiet(sender:UISwitch) {
        self.singleton.setHornQuiet(self.quietSwitch.state.getLogicValue())
    }
}
