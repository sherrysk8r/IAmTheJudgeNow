//
//  DeathSpiral.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

enum DeathSpiralType : String {
    case ForwardInside = "Forward Inside", ForwardOutside = "Forward Outside", BackwardInside = "Backward Inside",
    BackwardOutside = "Backward Outside"
}

class DeathSpiral {
    var insideSpiralDictionary = [DeathSpiralType : BaseValueLevels]()
    var outsideSpiralDictionary = [DeathSpiralType : BaseValueLevels]()
    
    init() {
        
    }
    
    func setBaseValues() {

    }
}

