//
//  Component.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/2/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation
import Darwin

class Component{
    var type:ComponentType?
    var criteria = [Criterion]()
    var appliedCriteria = [Criterion]()
    var score:Float = 0.0
    
    init(type: String, criteria: Array<Criterion>){
        self.type = ComponentType(rawValue: type)
        self.criteria = criteria
    }
    
    func getDefintion() -> String{
        return self.type!.getDefinition()
    }
    
    func filterCriteria(discipline: Discipline){
        appliedCriteria = self.criteria.filter({$0.includesDiscipline(discipline)})
    }
    
    func calcScore(percent: Float){
        if (percent > 0.75) {
            score = Float(arc4random_uniform(5))/4.0 + 9.0
        } else if (percent <= 0.75 && percent >= 0.6) {
            score = Float(arc4random_uniform(8))/4.0 + 7.0
        } else if (percent <= 0.6 && percent >= 0.5) {
            score = Float(arc4random_uniform(4))/4.0 + 5.0
        } else if (percent < 0.5 && percent >= 0.4) {
            score = Float(arc4random_uniform(4))/4.0 + 4.0
        } else if (percent < 0.4 && percent >= 0.25) {
            score = Float(arc4random_uniform(8))/4.0 + 2.0
        } else {
            score = Float(arc4random_uniform(8))/4.0
        }
    }
}

