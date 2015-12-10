//
//  ScoreSpin.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/10/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class ScoreSpin {
    var level: String?
    var spinType: SpinType?
    var spinManager = SpinManager()
    var featuresMet: Int = 0
    
    init(type: SpinType) {
        self.spinType = type
    }
    
    func setLevel(level: String) {
        self.level = level
    }
    
    func setFeaturesMet(featuresMet: Int) {
        self.featuresMet = featuresMet
    }
    
    func getAbbrev() -> String {
        return "\(spinType!.getAbbrev())\(level!)"
    }
    
    func getName() -> String {
        return "\(spinType!.rawValue) Level \(level!)"
    }
    
    func getBaseValue() -> Float {
        if let l = level {
            return spinManager.getBaseValue(spinType!, level: l)
        } else {
            return 0.0
        }
    }

}