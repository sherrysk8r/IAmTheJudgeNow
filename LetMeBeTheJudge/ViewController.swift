//
//  ViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/2/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var discipline: Discipline = Discipline.Ladies
    var segment: Segment = Segment.Short
    @IBOutlet weak var segmentInput: UISegmentedControl!
    
    @IBOutlet weak var selectLadies: UIButton!
    @IBOutlet weak var selectMen: UIButton!
    @IBOutlet weak var selectPairs: UIButton!
    @IBOutlet weak var selectIceDance: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackground(selectLadies)

        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        selectIceDance.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choseLadies(sender: UIButton){
        changePreviousSelection()
        changeBackground(sender)
        discipline = Discipline.Ladies
    }
    
    @IBAction func choseMen(sender: UIButton){
        changePreviousSelection()
        changeBackground(sender)
        discipline = Discipline.Men
    }
    
    @IBAction func chosePairs(sender: UIButton){
        changePreviousSelection()
        changeBackground(sender)
        discipline = Discipline.Pairs
    }
    
    @IBAction func choseIceDance(sender: UIButton){
        changePreviousSelection()
        changeBackground(sender)
        discipline = Discipline.IceDance
        
    }
    
    @IBAction func segmentSelection(sender: UISegmentedControl){
        switch segmentInput.selectedSegmentIndex{
        case 0:
            segment = Segment.Short
        case 1:
            segment = Segment.Free
        default:
            segment = Segment.Short
        }
    }
    
    func changeBackground(button: UIButton){
        button.backgroundColor = Colors.selectionColor
    }
    
    func unChangeBackground(button: UIButton){
        button.backgroundColor = Colors.mainColor
    }
    
    func changePreviousSelection(){
        switch discipline.rawValue{
        case "Ladies":
            unChangeBackground(selectLadies)
        case "Men":
            unChangeBackground(selectMen)
        case "Pairs":
            unChangeBackground(selectPairs)
        case "Ice Dance":
            unChangeBackground(selectIceDance)
        default:
            return
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "beginJudging"{
            let vc = segue.destinationViewController as! ElementViewController
            vc.programScore = ProgramScore(d: discipline, s: segment)
        }
    }
}

