//
//  NandorSingleton.swift
//  NANDOR
//
//  Created by Chris Nandor on 2014.06.02.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import Foundation

var defaults = NSUserDefaults()
var _hornQuiet:Bool = false {
    didSet {
        defaults.setObject(_hornQuiet, forKey: "hornQuiet")
    }
}
var _teamIndex:Int = 0 {
    didSet {
        defaults.setObject(_teamIndex, forKey: "teamIndex")
    }
}
var _song:String = "" {
    didSet {
        defaults.setObject(_song, forKey: "song")
    }
}

class NandorSingleton:NSObject {
    init() {
        if defaults.objectForKey("hornQuiet") {
            _hornQuiet = defaults.objectForKey("hornQuiet") as Bool
        }
        if defaults.objectForKey("teamIndex") {
            _teamIndex = defaults.objectForKey("teamIndex") as Int
        }
        if defaults.objectForKey("song") {
            _song = defaults.objectForKey("song") as String
        }
    }

    func hornQuiet() -> Bool { return _hornQuiet }
    func setHornQuiet(hornQuiet:Bool) { _hornQuiet = hornQuiet }

    func teamIndex() -> Int { return _teamIndex }
    func setTeamIndex(teamIndex:Int) { _teamIndex = teamIndex }

    func song() -> String { return _song }
    func setSong(song:String) { _song = song }
}