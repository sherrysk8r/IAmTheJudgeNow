//
//  DeathSpiralViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/10/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class DeathSpiralViewController: UIViewController {
    
    var programScore: ProgramScore?
    var element: String?
    
    @IBOutlet weak var direction: UISegmentedControl!
    @IBOutlet weak var edge: UISegmentedControl!
    
    var inside: Bool = true
    var forward: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Death Spiral"
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
    
    @IBAction func edgeSelection(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
            inside = true
        case 1:
            inside = false
        default:
            inside = true
        }
    }
    
    @IBAction func directionSelection(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
            forward = true
        case 1:
            forward = false
        default:
            forward = true
        }
    }
    
    func setType() -> DeathSpiralType{
        if inside == true && forward == true {
            return DeathSpiralType.ForwardInside
        } else if inside == true && forward == false {
            return DeathSpiralType.ForwardOutside
        } else if inside == false && forward == true {
            return DeathSpiralType.BackwardInside
        } else {
            return DeathSpiralType.BackwardOutside
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gradeLevel" {
            let vc = segue.destinationViewController as! LevelFormViewController
            vc.element = element
            vc.programScore = programScore
            vc.elementObj = DeathSpiral(type: setType())
        }
    }
}
