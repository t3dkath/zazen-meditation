//
//  ViewController.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var leadinTime: Int!
    var zazen1Time: Int!
    var kinhinTime: Int!
    var zazen2Time: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let userDefaults = NSUserDefaults.standardUserDefaults()
//        if (userDefaults.objectForKey(EXERCISE_KEY) == nil) {
//            self.seedExercises()
//        } else {
//            self.loadPosts()
//        }
    }
    
    override func viewDidAppear(animated: Bool) {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
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
                self.navigationController?.popViewControllerAnimated(true)
            default: break
            }
        }
    }

}
