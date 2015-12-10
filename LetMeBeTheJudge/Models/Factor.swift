//
//  Factor.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/2/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

struct Factor{
    var factor:Double = 0.0
    
    init(discipline: Discipline, segment:Segment) {
        switch discipline.rawValue{
        case "Ladies":
            factor = segment.rawValue == "Short" ? 0.8 : 1.6
        case "Men":
            factor = segment.rawValue == "Short" ? 1.0 : 2.0
        case "Pairs", "Ice Dance":
            factor = segment.rawValue == "Short" ? 0.8 : 1.2
        default:
            return
            
        }
    }
}
