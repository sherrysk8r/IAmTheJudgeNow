//
//  ChooseJumpViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/4/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class ChooseJumpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var programScore: ProgramScore?
    
    var jumps = [Jump]()
    var numRevols:Int = 1
    var jumpType: JumpType = JumpType.Axel
    var secondHalf: Bool = false
    
    var finalJump: ScoreJump?
    
    @IBOutlet weak var addJumpButton: UIButton!
    @IBOutlet weak var secondHalfSwitch: UISwitch!
    @IBOutlet weak var revolutions: UISegmentedControl!
    @IBOutlet weak var jumpTypes: UIPickerView!
    let jumpTypeData = JumpType.allString
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jumpTypes.dataSource = self
        jumpTypes.delegate = self
        
        self.title = "Describe the Jump"
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem

    }
    
    @IBAction func segmentSelection(sender: UISegmentedControl){
        numRevols = revolutions.selectedSegmentIndex + 1
    }
    
    @IBAction func addJump(sender: UIButton) {
        jumps.append(Jump(jumpType: jumpType, revolutions: numRevols, secondHalf: secondHalf))
        reset()
    }
    
    @IBAction func finalJump(sender: UIButton) {
        jumps.append(Jump(jumpType: jumpType, revolutions: numRevols, secondHalf: secondHalf))
        finalJump = ScoreJump(jumps: jumps)

    }
    
    func switchValueDidChange(sender:UISwitch!){
        if sender.on {
            secondHalf = true
        } else {
            secondHalf = false
        }
    }
    
    func reset() {
        revolutions.selectedSegmentIndex = 0
        self.title = "Describe the Next Jump"
        if jumps.count > 2 {
            addJumpButton.enabled = false
        }
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gradeJump" {
            let vc = segue.destinationViewController as! GOEFormViewController
            vc.programScore = programScore!
            vc.element = "Jumps"
            vc.elementObj = finalJump
        }
    }
}
