//
//  ZazenVC.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class ZazenVC: ViewController {
    
    var finished = false
    var count: Int!
    var currentObject: String = "Preparation"
    var timerSeconds: Int!
    
    @IBOutlet weak var closeZendo: UIButton!
    @IBOutlet weak var activityLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().idleTimerDisabled = true
        
        count = Meditation.instance.leadinTime
        updateLabels()
        playTimer()
        setupBells()
        
        let labels = [activityLbl, timerLbl]
        addPageLetterSpacing(labels)
    }
    
    @IBAction func onCloseZendoPressed(sender: AnyObject) {
        bells2.play()
        UIApplication.sharedApplication().idleTimerDisabled = false
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func playTimer() {
        meditateTimer?.invalidate()
        meditateTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timerTick"), userInfo: nil, repeats: false)
    }
    
    func onTimerEnd() {
        switch(currentObject) {
        case "Preparation":
            bells3.play()
            currentObject = "Zazen1"
            count = Meditation.instance.zazen1Time.inSeconds
        case "Zazen1":
            if Meditation.instance.objectType == objectType.ZAZEN.rawValue {
                finished = true
                finishMeditation()
            } else {
                bells3.play()
                currentObject = "Kinhin"
                count = Meditation.instance.kinhinTime.inSeconds
            }
        case "Kinhin":
            bells2.play()
            currentObject = "Zazen2"
            count = Meditation.instance.zazen2Time.inSeconds
        default:
            finished = true
            finishMeditation()
        }
        
        if !finished {
            updateLabels()
            playTimer()
        }
    }
    
    func finishMeditation() {
        bells3.play()
        activityLbl.hidden = true
        timerLbl.hidden = true
        closeZendo.hidden = false
        
        meditateTimer?.invalidate()
    }
    
    func timerTick() {
        updateLabels()
        if count > 0 {
            count = count - 1
            playTimer()
        } else {
            onTimerEnd()
        }
    }
    
    func updateLabels() {
        if currentObject == "Zazen1" || currentObject == "Zazen2" {
            activityLbl.text = "Zazen"
        } else {
            activityLbl.text = currentObject
        }
        if currentObject == "Preparation" {
            timerLbl.text = String(count.inSecondsDisplay)
        } else {
            timerLbl.text = String(count.inMinutes)
        }
        
        addPageLetterSpacing([timerLbl, activityLbl])
    }
    
}
