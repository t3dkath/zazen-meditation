//
//  ViewController.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum objectType:Int {
        case ZAZEN = 0
        case KINHIN = 1
    }
    
    var bells1 = AVAudioPlayer()
    var bells2 = AVAudioPlayer()
    var bells3 = AVAudioPlayer()
    
    var bell1 = "1 Bell"
    var bell2 = "2 Bells"
    var bell3 = "3 Bells"
    
    var meditateTimer: NSTimer?
    let ALPHA_VALUE: CGFloat = 0.15
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    
    @IBAction func goToSettings(sender: UIButton) {
        if sender.tag == objectType.ZAZEN.rawValue {
            Meditation.instance.objectType = objectType.ZAZEN.rawValue
        } else {
            Meditation.instance.objectType = objectType.KINHIN.rawValue
        }
        performSegueWithIdentifier("OptionsSegue", sender: self)
    }
    
    @IBAction func showAboutPage() {
        performSegueWithIdentifier("AboutSegue", sender: self)
    }
    
    func addPageLetterSpacing(labels: [UILabel!]) {
        for label in labels {
            label.attributedText = NSAttributedString(string: label.text!.uppercaseString, attributes: [NSKernAttributeName: 5])
        }
        
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                meditateTimer?.invalidate()
                UIApplication.sharedApplication().idleTimerDisabled = false
                self.navigationController?.popViewControllerAnimated(true)
            default: break
            }
        }
    }
    
    
    
    func setupBells() {
        if Meditation.instance.bellType == 0 {
            bell1 = "1 Bell"
            bell2 = "2 Bells"
            bell3 = "3 Bells"
        } else {
            bell1 = "1 Bell sm"
            bell2 = "2 Bells sm"
            bell3 = "3 Bells sm"
        }
        
        let bells1URL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(bell1, ofType: "wav")!)
        let bells2URL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(bell2, ofType: "wav")!)
        let bells3URL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(bell3, ofType: "wav")!)
        
        
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
    }

}
