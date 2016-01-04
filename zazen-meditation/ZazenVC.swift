//
//  ZazenVC.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit
import AVFoundation

class ZazenVC: ViewController {
    
    var finished = false
    var count: Int!
    var currentObject: String = "Preparation"
    var timerSeconds: Int!
    
    var bells3URL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("btn", ofType: "wav")!)
    }
    var bells3 = AVAudioPlayer()
    
    var bells2URL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("btn", ofType: "wav")!)
    }
    var bells2 = AVAudioPlayer()
    
    var bells1URL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("btn", ofType: "wav")!)
    }
    var bells1 = AVAudioPlayer()
    
    var closeZendoBellURL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("btn", ofType: "wav")!)
    }
    var closeZendoBell = AVAudioPlayer()
    
    @IBOutlet weak var closeZendo: UIButton!
    @IBOutlet weak var activityLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().idleTimerDisabled = true
        
        count = Meditation.instance.leadInTime.inSeconds
        updateLabels()
        setupBells()
        playTimer()
        
        let labels = [activityLbl, timerLbl]
        addPageLetterSpacing(labels)
    }
    
    @IBAction func onCloseZendoPressed(sender: AnyObject) {
        closeZendoBell.play()
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
        bells1.play()
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
        timerLbl.text = String(count.inMinutes)
        
        addPageLetterSpacing([timerLbl, activityLbl])
    }
    
    func setupBells() {
        do {
            try bells3 = AVAudioPlayer(contentsOfURL: bells3URL)
            bells3.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        do {
            try bells2 = AVAudioPlayer(contentsOfURL: bells2URL)
            bells2.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        do {
            try bells1 = AVAudioPlayer(contentsOfURL: bells1URL)
            bells1.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        do {
            try closeZendoBell = AVAudioPlayer(contentsOfURL: closeZendoBellURL)
            closeZendoBell.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}
