//
//  Criterion.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/2/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Criterion {
    var criterion:String?
    var explanation:String?
    var discipline = [String]()
    
    init(criterion:String?=nil, explanation:String?=nil, discipline: Array<String>?=nil){
        if let c = criterion{
            self.criterion = c
        } else {
            self.criterion = nil
        }
        
        if let e = explanation{
            self.explanation = e
        } else {
            self.explanation = nil
        }
        
        if let d = discipline{
            self.discipline = d
        }
    }
    
    func includesDiscipline(d: Discipline) -> Bool {
        if discipline.count == 0{
            return true
        }else{
            return contains(discipline, d.rawValue)
        }
    }
}
