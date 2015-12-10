//
//  GOE.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class GOE {
    var criteria = [String]()
    var deductions = [Deduction]()
    
    init(criteria: [String], deductions: [Deduction]){
        self.criteria = criteria
        self.deductions = deductions
    }
}