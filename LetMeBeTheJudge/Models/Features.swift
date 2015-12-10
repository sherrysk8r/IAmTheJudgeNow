//
//  Features.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Features {
    class var featuresDictionary: [String : [String]] {
       return ["Spins": Features.setSpins(), "Twist Lifts" : Features.setTwistLifts(), "Pair Lifts" : Features.setLifts(), "Step Sequence" : Features.setStepSequences(), "Death Spiral" : Features.setDeathSpirals(), "Solo Spins" : Features.setSoloSpins(), "Pair Spins" : Features.setPairSpins()]
    }
    
//    class func setTwizzles() -> [String] {
//        
//    }
    
    class func setSpins() -> [String]{
        var spins = [String]()
        spins.append("A difficult variation in a basic or (for spin combinations only) in an intermediate position")
        spins.append("Change of foot executed by jump")
        spins.append("Jump within a spin without changing feet")
        spins.append("Difficult change of position on the same foot")
        spins.append("Difficult entrance into a spin")
        spins.append("Clear change of edge in sit (only from backward inside to forward outside), camel, Layback and Biellmann Position")
        spins.append("All 3 basic positions on the second foot")
        spins.append("Both directions immediately following each other in sit or camel spin")
        spins.append("Clear increase of speed in camel, sit, layback or Biellmann position")
        spins.append("At least 6 rev. without changes in pos./variation, foot and edge (camel, layback, difficult variation of any basic or non-basic position)")
        return spins
    }
    class func setTwistLifts() -> [String] {
        var twistLifts = [String]()
        twistLifts.append("Lady’s split position (each leg at least 45° from the body axis and Lady’s legs are straight or almost straight)")
        twistLifts.append("Catching the lady at the side of the waist without her hand(s)/arm(s)/any part of upper body touching the man")
        twistLifts.append("Lady’s position in the air with arm(s) above the head (minimum one full revolution)")
        twistLifts.append("Difficult take-off")
        twistLifts.append("Man’s arms sideways, being straight or almost straight, reaching at least shoulder level after release of the lady")
        return twistLifts
    }
    
    class func setLifts() -> [String] {
        var pairLifts = [String]()
        pairLifts.append("Difficult variation of the take-off and/or difficult landing variety")
        pairLifts.append("1 change of hold and/or lady’s position (1 rev. of the man before and after the change, counts twice if repeated)")
        pairLifts.append("Difficult variation of the lady (one full revolution)")
        pairLifts.append("Difficult (simple for juniors) carry (not for SP)")
        pairLifts.append("One-hand-hold of the man (2 full revolutions in total not counting parts shorter than 1 rev.)")
        pairLifts.append("Additional revolutions of the man with one-hand-hold after 2 revs in 5) (only in FS and only in one lift)")
        pairLifts.append("Change of rotational direction by the man (one rev. before and after the change, counts only once per program)")
        return pairLifts
    }
    
    class func setStepSequences() -> [String] {
        var stepSequences = [String]()
        stepSequences.append("Simple variety (Level 2), variety (Level 3), complex (Level 4) of turns and steps throughout (compulsory)")
        stepSequences.append("Rotations (turns, steps) in either direction (left and right) with full body rotation covering at least 1/3 of the pattern in total for each rotational direction")
        stepSequences.append("Moderate (full for Level 4) use of upper body movement")
        stepSequences.append("Quick changes of rotational direction executed with turns and steps")
        return stepSequences
    }
    
    class func setDeathSpirals() -> [String] {
        var deathSpirals = [String]()
        deathSpirals.append("Difficult entry (immediately preceding the death spiral) and/or exit")
        deathSpirals.append("Full revolution(s) of the lady when both partners are in “low” positions (counts as many times as performed)")
        return deathSpirals
    }
    
    class func setSoloSpins() -> [String] {
        return self.setSpins()
    }
    
    class func setPairSpins() -> [String] {
        var pairSpins = [String]()
        pairSpins.append("Changes of basic positions of both partners")
        pairSpins.append("3 difficult variations of positions of partners, only one of which can be in non-basic position")
        pairSpins.append("Any other difficult variation in a basic position of either partner (each partner must have two difficult variations)")
        pairSpins.append("Entrance from backward outside or inside edge")
        pairSpins.append("Both directions immediately following each other")
        pairSpins.append("At least 6 revolutions without any changes in position/variation and foot")
        return pairSpins
    }
}