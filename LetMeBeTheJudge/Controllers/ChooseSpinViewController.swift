//
//  ChooseSpinViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/10/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class ChooseSpinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var programScore: ProgramScore?
    var element: String = ""
    
    @IBOutlet weak var style: UIPickerView!
    
    var spinTypeData = SpinType.all
    var selectedSpinType: SpinType = SpinType.Upright
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        self.title = element
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return spinTypeData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return spinTypeData[row].rawValue
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSpinType = spinTypeData[row]
    }
    
    func createElementObj() -> ScoreSpin {
        return ScoreSpin(type: selectedSpinType)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gradeLevel" {
            let vc = segue.destinationViewController as! LevelFormViewController
            vc.programScore = programScore!
            vc.element = element
            vc.elementObj = createElementObj()
        }
    }
  }
