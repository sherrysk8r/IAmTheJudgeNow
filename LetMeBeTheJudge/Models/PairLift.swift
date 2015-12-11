//
//  PairLift.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/9/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class PairLift {
    var type: LiftTypes?
    var level: String?
    var baseValue: Float = 0.0
    //var liftManager: LiftManager = LiftManager()
    
    init(type: LiftTypes, revolutions: Int) {
        self.type = type
    }
    
    func setLevel(level: String) {
        self.level = level
    }
    
    func getName() -> String {
        return "\(type!.rawValue) Level \(level)"
    }
    
    func getAbbrev() -> String {
        return "\(type!.getAbbrev())\(level)"
    }
    
//    func getBaseValue() -> Float {
//        return liftManager.getBaseValue(type, level: level)
//    }
}