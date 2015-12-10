//
//  TechnicalElementResultViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class TechnicalElementResultViewController: UIViewController {
    var element: String?
    var programScore: ProgramScore?
    var levelRequired: Bool = false
    
    var elementObj: AnyObject?
    var unfactoredGOE: Int = 0
    var factoredGOE: Float = 0.0
    var baseValue: Float = 0.0
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var displayBaseValue: UILabel!
    @IBOutlet weak var displayGOE: UILabel!
    @IBOutlet weak var displayFinalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(element!) Result"

        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        calcGOE()
        fillInLabels()
        saveElement()
        
        println("received GOE: \(unfactoredGOE)")
    }
    
    func fillInLabels(){
        setName()
        
        getBaseDisplay()
        displayGOE.text = "\(unfactoredGOE) factored to \(factoredGOE)"
        displayFinalScore.text = "\(factoredGOE + baseValue)"
    }
    
    func calcGOE(){
        if let e = elementObj as? ScoreJump{
            if e.jumps.count > 1 {
                factoredGOE = e.calcGOE(unfactoredGOE)
            } else {
                factoredGOE = GOEPoints.getJumpGOE(e.baseValue, GOE: unfactoredGOE)
            }
        }
        
        if let e = elementObj as? ThrowJump {
            factoredGOE = GOEPoints.getThrowJumps(e.getBaseValue(), GOE: unfactoredGOE)
        }
        
        if let e = elementObj as? StepSequence {
            factoredGOE = GOEPoints.getStepSequences(unfactoredGOE)
        }
        
        if let e = elementObj as? PairSpin {
            factoredGOE = GOEPoints.getStepSequences(unfactoredGOE)
        }
        
        if let e = elementObj as? ScoreSpin {
            factoredGOE = GOEPoints.getSpinGOE(unfactoredGOE)
        }
    }
    
    func setName() {
        if let e = elementObj as? ScoreJump {
            name.text = "\(e.getName()) : \(e.getAbbrev())"
        }
        
        if let e = elementObj as? ThrowJump {
            name.text = "\(e.getName()) : \(e.getAbbrev())"
        }
        
        if let e = elementObj as? StepSequence {
            name.text = "\(e.getName()) : \(e.getAbbrev())"
        }
        
        if let e = elementObj as? PairSpin {
            name.text = "\(e.getName()) : \(e.getAbbrev())"
        }
        
        if let e = elementObj as? ScoreSpin {
            name.text = "\(e.getName()) : \(e.getAbbrev())"
        }
    }
    
    func getBaseDisplay() {
        if let e = elementObj as? ScoreJump {
            displayBaseValue.text = "\(e.baseValue)"
            baseValue = e.baseValue
        }
        
        if let e = elementObj as? ThrowJump {
            displayBaseValue.text = "\(e.baseValue)"
            baseValue = e.baseValue
        }
        
        if let e = elementObj as? StepSequence {
            displayBaseValue.text = "\(e.getBaseValue())"
            baseValue = e.getBaseValue()
        }
        
        if let e = elementObj as? PairSpin {
            displayBaseValue.text = "\(e.getBaseValue())"
            baseValue = e.getBaseValue()
        }
        
        if let e = elementObj as? ScoreSpin {
            displayBaseValue.text = "\(e.getBaseValue())"
            baseValue = e.getBaseValue()
        }
    }
    
    func saveElement() {
        programScore?.technicalScores[element!] = factoredGOE + baseValue
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "continueJudging" {
            let vc = segue.destinationViewController as! ElementViewController
            vc.programScore = programScore!
        }
    }
}
