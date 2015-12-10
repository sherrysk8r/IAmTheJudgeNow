//
//  Env.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/9/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation
import UIKit

class Env {
    
    static var iPad: Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
}
