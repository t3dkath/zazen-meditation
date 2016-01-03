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
    var currentObject: String = "Lead In"
    var meditateTimer: NSTimer?
    var timerSeconds: Int!
    
    var bellURL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("btn", ofType: "wav")!)
    }
    var bellSound = AVAudioPlayer()
    
    @IBOutlet weak var closeZendo: UIButton!
    @IBOutlet weak var activityLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBells()
        
        let labels = [activityLbl, timerLbl]
        
        count = Meditation.instance.leadInTime.inSeconds
        playTimer()
        
        addPageLetterSpacing(labels)
    }
    
    @IBAction func onCloseZendoPressed(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func playTimer() {
        meditateTimer?.invalidate()
        meditateTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timerTick"), userInfo: nil, repeats: false)
    }
    
    func onTimerEnd() {
        switch(currentObject) {
        case "Lead In":
            //play 3 bells
            bellSound.play()
            
            currentObject = "Zazen1"
            count = Meditation.instance.zazen1Time.inSeconds
        case "Zazen1":
            if Meditation.instance.objectType == objectType.ZAZEN.rawValue {
                finished = true
                finishMeditation()
            } else {
                //play 3 bells
                bellSound.play()
                
                currentObject = "Kinhin"
                count = Meditation.instance.kinhinTime.inSeconds
            }
        case "Kinhin":
            //play 2 bells
            bellSound.play()
            
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
        //bell 1 bell
        activityLbl.hidden = true
        timerLbl.hidden = true
        closeZendo.hidden = false
        
        meditateTimer?.invalidate()
        print("Finish")
    }
    
    func timerTick() {
        //print(count)
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
            try bellSound = AVAudioPlayer(contentsOfURL: bellURL)
            bellSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}
