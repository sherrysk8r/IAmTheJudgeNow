//
//  LiftTypes.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

enum LiftTypes: String {
    case ArmpitHoldLifts = "Armpit-hold lifts", WaistHoldLifts = "Waist-hold lifts", HandToHipLifts = "Hand-to-hip lifts", HandToHandLifts = "Hand-to-hand lifts", ToeStepLassoLifts = "Toe/Step in Lasso lifts", AxelReverseLassoLifts = "Axel/Reverse Lasso lifts"
    
    case LutzTwistLifts = "Lutz Twist lift", FlipTwistLifts = "Flip Twist lifts", ToeloopTwistLifts = "Toeloop Twist lifts", AxelTwistLifts = "Axel Twist lifts"
    
    static let pairLifts = [ArmpitHoldLifts, WaistHoldLifts, HandToHipLifts, HandToHandLifts, ToeStepLassoLifts, AxelReverseLassoLifts]
    
    static let twistLifts = [LutzTwistLifts, FlipTwistLifts, ToeloopTwistLifts, AxelTwistLifts]
    
    
    func getGroup() -> Int {
        switch self{
        case .ArmpitHoldLifts:
            return 1
        case .WaistHoldLifts:
            return 2
        case .HandToHipLifts:
            return 3
        case .HandToHandLifts:
            return 4
        case .ToeStepLassoLifts, .AxelReverseLassoLifts:
            return 5
        default:
            return 0
        }
    }

}