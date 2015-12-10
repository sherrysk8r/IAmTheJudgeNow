//
//  JumpType.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/4/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

enum JumpType:String{
    case Axel = "Axel", Lutz = "Lutz", Flip = "Flip", Loop = "Loop", Salchow = "Salchow", ToeLoop = "ToeLoop"
    
    static let all = [Axel, Lutz, Flip, Loop, Salchow, ToeLoop]
    static let allString = ["Axel", "Lutz", "Flip", "Loop", "Salchow", "Toe Loop"]
    
    func getAbbrev() -> String{
        switch self{
        case .Axel:
            return "A"
        case .Lutz:
            return "Lz"
        case .Flip:
            return "F"
        case .Loop:
            return "Lo"
        case .Salchow:
            return "S"
        case .ToeLoop:
            return "T"
        }
    }
    
}