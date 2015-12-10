//
//  ThrowJumpViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class ThrowJumpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var programScore: ProgramScore?
    var jumpType: JumpType = JumpType.Axel
    var throwJump: ThrowJump?
    
    var numRevols: Int = 1
    @IBOutlet weak var revolutions: UISegmentedControl!
    @IBOutlet weak var jumpTypes: UIPickerView!
    let jumpTypeData = JumpType.allString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jumpTypes.dataSource = self
        jumpTypes.delegate = self
        
        self.title = "Describe the Throw Jump"
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gradeThrowJump" {
            let vc = segue.destinationViewController as! GOEFormViewController
            vc.programScore = programScore
            vc.element = "Throw Jumps"
            vc.elementObj = throwJump
        }
    }
    
    @IBAction func segmentSelection(sender: UISegmentedControl){
        numRevols = revolutions.selectedSegmentIndex + 1
    }
    
    @IBAction func finalJump(sender: UIButton) {
        throwJump = ThrowJump(jumpType: jumpType, revolutions: numRevols)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jumpTypeData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jumpTypeData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        jumpType = JumpType(rawValue: jumpTypeData[row].stringByReplacingOccurrencesOfString(" ", withString: ""))!
    }

}
