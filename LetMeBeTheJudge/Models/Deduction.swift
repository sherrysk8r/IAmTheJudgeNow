//
//  Deduction.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/7/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation
import Darwin

struct Deduction {
    var description: String
    var minImpactOnGOE: Int
    var maxImpactOnGOE: Int
    
    init(description: String, minImpactOnGOE: Int, maxImpactOnGOE: Int?) {
        self.description = description
        self.minImpactOnGOE = minImpactOnGOE

        if let max = maxImpactOnGOE {
            self.maxImpactOnGOE = max
        } else {
            self.maxImpactOnGOE = minImpactOnGOE
        }
    }
    
    func getRandDeduction() -> Int {
        if minImpactOnGOE == maxImpactOnGOE {
            return minImpactOnGOE
        } else {
            return Int(arc4random_uniform(UInt32(maxImpactOnGOE - minImpactOnGOE + 1))) + minImpactOnGOE
        }
    }
}