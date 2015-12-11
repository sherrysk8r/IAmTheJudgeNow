//
//  TwistLift.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/9/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class TwistLift {
    var type: LiftTypes?
    var level: String?
    var revolutions: Int = 0
    var baseValue: Float = 0.0
    
    init(type: LiftTypes, revolutions: Int) {
        self.type = type
    }
    
    func setLevel(level: String) {
        self.level = level
    }
    
    func getName() -> String {
        return "\(Revolutions.revolutions[revolutions]) \(type!.rawValue) Level \(level)"
    }
    
    func getAbbrev() -> String {
        return "\(revolutions)\(type!.getAbbrev())\(level)"
    }
    
    func getBaseValue() -> Float {
        return 0.0
    }
}