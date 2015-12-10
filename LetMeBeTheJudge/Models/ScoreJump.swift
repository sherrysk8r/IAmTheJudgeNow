//
//  ScoreJump.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/4/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class ScoreJump{
    var jumps = [Jump]()
    var baseValue: Float = 0.0
    var GOE: Float = 0.0
    
    
    init(jumps: [Jump]){
        self.jumps = jumps
        self.baseValue = self.combinedBaseValue()
    }
    
    func calcGOE(GOE: Int) -> Float{
        var g: Int = checkInRange(GOE)
        var baseVal = self.jumps.first?.baseValue
        self.GOE = GOEPoints.getJumpGOE(baseVal!, GOE: g)
        return self.GOE
    }
    
    func checkInRange(GOE: Int) -> Int {
        if GOE > 3 {
            return 3
        } else if GOE < -3 {
            return -3
        } else {
            return GOE
        }
    }
    
    func combinedBaseValue() -> Float{
        var baseValue: Float = 0.0
        for jump in jumps{
            baseValue += jump.getBaseValue()
        }
        return baseValue
    }
    
    func finalScore(GOE: Int) -> Float{
        return calcGOE(GOE) + combinedBaseValue()
    }
    
    func getAbbrev() -> String {
        return "+".join(jumps.map({"\($0.getAbbrev())"}))
    }
    
    func getName() -> String {
        return " ".join(jumps.map({"\($0.getName())"}))
    }
}