//
//  Skate.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/2/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

enum Segment{
    case Short, Free
    
    func getDescription() -> String{
        switch self{
        case .Short:
            return "Short"
        case .Free:
            return "Free"
        }
    }
}