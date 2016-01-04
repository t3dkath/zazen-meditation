//
//  ViewController.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum objectType:Int {
        case ZAZEN = 0
        case KINHIN = 1
    }
    
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

}
