//
//  ElementViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/3/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {
    var fromComponentForm: Bool = false
    
    var programScore: ProgramScore?
    
    @IBOutlet weak var componentInput: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var graph: UIButton!
    @IBOutlet weak var finalScore: UIButton!
    
    var technicalButtons = [String : Int]()
    
    var skatingSkills = UIButton()
    var technicalTransitions = UIButton()
    var performanceExecution = UIButton()
    var choreoComposition = UIButton()
    var interpretationTiming = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        technicalButtons = ["Jumps": 1, "Spins": 2, "Step Sequence": 3, "Twist Lifts" : 4, "Throw Jumps" : 5, "Pair Lifts" : 6, "Death Spiral" : 7, "Dance Lifts" : 8, "Twizzles" : 9, "Dance Elements" : 10, "Solo Spins": 11, "Pair Spins": 12]
        
        if fromComponentForm {
            componentInput.selectedSegmentIndex = 1
        }
        
        segmentSelection(self.componentInput)
        
        self.title = "Let's Judge"
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        
        if !programScore!.componentScores.allGraded() {
            graph.enabled = false
            graph.backgroundColor = UIColor.whiteColor()
        } else {
            graph.backgroundColor = Colors.mainColor
        }
        
        if programScore!.minTechnicalGraded() && programScore!.componentScores.allGraded() {
            finalScore.backgroundColor = Colors.mainColor
        } else {
            finalScore.enabled = false
            finalScore.backgroundColor = UIColor.whiteColor()
        }
    }
    
    @IBAction func segmentSelection(sender: UISegmentedControl){
        switch componentInput.selectedSegmentIndex{
        case 0:
            createTechnicalView()
        case 1:
             createComponentView()
        default:
             createTechnicalView()
        }
    }
    
    func createTechnicalView(){
        clearView(contentView)
        
        let technicalRequirements = programScore!.getApplicableElements()
        
        let width: CGFloat = technicalRequirements.count > 4 ? (self.view.frame.width - 100)/2 : self.view.frame.width - 100
        let height: CGFloat = 80
        let xCenter:CGFloat = (self.view.frame.width - width)/2
        let fontSize: Int = technicalRequirements.count > 4 ? 18 : 25
        
        let yStart:CGFloat = CGFloat(15)
        let yInterval: CGFloat = height + 10
        
        
        
        for i in 0...technicalRequirements.count - 1 {
            var requirement: String = technicalRequirements[i]
            var buttonY: CGFloat = technicalRequirements.count > 4 ? yStart + CGFloat(i/2)*yInterval : yStart + CGFloat(i)*yInterval
            var buttonX = xCenter
            
            if technicalRequirements.count > 4 {
                if i%2 == 0 {
                    buttonX = xCenter - (0.6*width)
                } else {
                    buttonX = xCenter + (0.6*width)
                }
            }
            
            var button = createButton(requirement, x: buttonX, y: buttonY, width: width, height: height, size: fontSize)
            if contains(Array(technicalButtons.keys), requirement) {
                button.tag = technicalButtons[requirement]!
            }
            contentView.addSubview(button)
        }        
    }
    
    func createComponentView(){
        clearView(contentView)
        let width: CGFloat = self.view.frame.size.width/CGFloat(2.9)
        let height: CGFloat = width
        
        let fontSize: Int = self.view.frame.size.width > CGFloat(500) ? 25 : 15
        let xCenter: CGFloat = (self.view.frame.size.width - width)/2
        let xLeft: CGFloat = xCenter - (self.view.frame.size.width)/4
        let xRight: CGFloat = xCenter + (self.view.frame.size.width)/4
        let yStart: CGFloat = CGFloat(15)
        let yBetweenRow: CGFloat = height + 10
        
        skatingSkills = createButton(ComponentType.SkatingSkills.getDisplayFriendlyVersion(), x: xCenter, y: yStart, width: width, height: height, size: fontSize)
        technicalTransitions = createButton(ComponentType.TechnicalTransitions.getDisplayFriendlyVersion(), x: xLeft, y: yStart + yBetweenRow, width: width, height: height, size: fontSize)
        performanceExecution = createButton(ComponentType.PerformanceExecution.getDisplayFriendlyVersion(), x: xLeft, y: yStart + 2*yBetweenRow, width: width, height: height, size: fontSize)
        choreoComposition = createButton(ComponentType.ChoreoComposition.getDisplayFriendlyVersion(), x: xRight, y: yStart + yBetweenRow, width: width, height: height, size: fontSize)
        interpretationTiming = createButton(ComponentType.InterpretationTiming.getDisplayFriendlyVersion(), x: xRight, y: yStart + 2*yBetweenRow, width: width, height: height, size: fontSize)
        
        setColor([skatingSkills, technicalTransitions, performanceExecution, choreoComposition, interpretationTiming])
        contentView.addSubview(skatingSkills)
        contentView.addSubview(technicalTransitions)
        contentView.addSubview(performanceExecution)
        contentView.addSubview(choreoComposition)
        contentView.addSubview(interpretationTiming)
    }
    
    func createButton(title:String, x:CGFloat, y:CGFloat, width: CGFloat, height: CGFloat, size:Int = 18) -> UIButton{
        let button = UIButton()
        button.frame = CGRectMake(CGFloat(x), CGFloat(y), CGFloat(width), CGFloat(height))
        button.backgroundColor = Colors.mainColor
        button.setTitle(title, forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        button.titleLabel!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        button.titleLabel!.textAlignment = .Center
        button.titleLabel!.font = UIFont.systemFontOfSize(CGFloat(size))
        
        if width == height{
            button.layer.cornerRadius = CGFloat(width/2)
            button.titleEdgeInsets = UIEdgeInsetsMake(1, 3, 1, 3)
        }
        
        return button
    }
    
    func clearView(view: UIView){
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func buttonClicked(sender: UIButton?) {
        if sender!.tag == technicalButtons["Jumps"] {
            self.performSegueWithIdentifier("showJumpOptions", sender: sender)
        } else if sender!.tag == technicalButtons["Spins"] {
            self.performSegueWithIdentifier("chooseSpin", sender: sender)
        } else if sender!.tag == technicalButtons["Step Sequence"] {
            self.performSegueWithIdentifier("gradeLevel", sender: sender)
        } else if sender!.tag == technicalButtons["Throw Jumps"] {
            self.performSegueWithIdentifier("chooseThrowJump", sender: sender)
        } else if sender!.tag == technicalButtons["Pair Lifts"] {
            
        } else if sender!.tag == technicalButtons["Twist Lifts"] {
            
        } else if sender!.tag == technicalButtons["Solo Spins"] {
            self.performSegueWithIdentifier("chooseSpin", sender: sender)
        } else if sender!.tag == technicalButtons["Pair Spins"] {
            self.performSegueWithIdentifier("gradeLevel", sender: sender)
        } else if sender!.tag == technicalButtons["Death Spiral"] {
            
        } else if sender!.tag == technicalButtons["Dance Lifts"] {
            
        } else if sender!.tag == technicalButtons["Twizzles"] {
            self.performSegueWithIdentifier("gradeLevel", sender: sender)
        } else if sender!.tag == technicalButtons["Dance Elements"] {
            
        }
        else {
            self.performSegueWithIdentifier("showComponentsForm", sender: sender)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showJumpOptions"{
            let vc = segue.destinationViewController as! ChooseJumpViewController
            vc.programScore = programScore!
        }
    
        if segue.identifier == "showComponentsForm"{
            let vc = segue.destinationViewController as! ComponentFormViewController
            var title = sender?.titleLabel!!.text
            var rawValue = title!.stringByReplacingOccurrencesOfString(" & ", withString: "/")
            
            var component = programScore!.componentManager.allComponents[rawValue]
            vc.component = component
            vc.programScore = programScore!
        }
        
        if segue.identifier == "chooseThrowJump" {
            let vc = segue.destinationViewController as! ThrowJumpViewController
            vc.programScore = programScore!
        }
        
        if segue.identifier == "showPositionGraph" {
            let vc = segue.destinationViewController as! GraphComponentsViewController
            vc.programScore = programScore!
        }
        
        if segue.identifier == "showFinal" {
            let vc = segue.destinationViewController as! FinalResultViewController
            vc.programScore = programScore!
        }
        
        if segue.identifier == "gradeLevel" {
            let vc = segue.destinationViewController as! LevelFormViewController
            vc.programScore = programScore!
            var keys = (technicalButtons as NSDictionary).allKeysForObject(sender!.tag) as! [String]
            vc.element = keys.first!
            println(vc.element)
        }
        
        if segue.identifier == "chooseSpin" {
            let vc = segue.destinationViewController as! ChooseSpinViewController
            var keys = (technicalButtons as NSDictionary).allKeysForObject(sender!.tag) as! [String]
            vc.programScore = programScore!
            vc.element = keys.first!
        }
    }
    
    func changeBackground(button: UIButton){
        button.backgroundColor = Colors.selectionColor
    }

    func setColor(buttons: [UIButton]){
        for button in buttons{
            var title = button.titleLabel!.text
            var rawValue = ComponentType(rawValue: title!.stringByReplacingOccurrencesOfString(" & ", withString: "/"))
            if programScore!.componentScores.graded(rawValue!){
                changeBackground(button)
            }
        }
    }
}
