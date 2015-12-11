//
//  LiftManager.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/10/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class LiftManager {
    var pairLifts = [LiftTypes: BaseValueLevels]() //defines the base values
    //var twistLifts = [LiftTypes: BaseValueJumps]()
    var deductions = [Deduction]()
    var positiveGOE = [String]()
    
    init() {
        setBaseValues()
    }
    
//    func getBaseValue(pairLifts: SpinType, level: String) -> Float {
//        return pairLifts[pairLifts]!.baseValues!.valueDictionary[level]!
//    }
    
    func setBaseValues() {
        pairLifts[LiftTypes.ArmpitHoldLifts] = BaseValueLevels(levelB: 1.1, level1: 1.1, level2: 1.3, level3: 1.5, level4: 1.7)
        pairLifts[LiftTypes.WaistHoldLifts] = BaseValueLevels(levelB: 1.3, level1: 1.3, level2: 1.7, level3: 2.4, level4: 3.0)
        pairLifts[LiftTypes.HandToHipLifts] = BaseValueLevels(levelB: 2.5, level1: 2.5, level2: 3.0, level3: 3.5, level4: 4.0)
        pairLifts[LiftTypes.HandToHandLifts] = BaseValueLevels(levelB: 2.5, level1: 2.5, level2: 3.0, level3: 3.5, level4: 4.0)
        
        pairLifts[LiftTypes.ToeStepLassoLifts] = BaseValueLevels(levelB: 4.5, level1: 4.5, level2: 5.0, level3: 5.5, level4: 6.0)
        pairLifts[LiftTypes.AxelReverseLassoLifts] = BaseValueLevels(levelB: 5.0, level1: 5.0, level2: 5.5, level3: 6.0, level4: 6.5)
        
       
    }
}