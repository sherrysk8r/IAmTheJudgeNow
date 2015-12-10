//
//  Spin.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/6/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Spin{
    var type: SpinType?
    var baseValues: BaseValueLevels?
    var allSpins = [Spin]()
    var features = [String]()
    var deductions = [Deduction]()
    
    init(type: SpinType, baseValues: BaseValueLevels) {
        self.type = type
        self.baseValues = baseValues
    }
}