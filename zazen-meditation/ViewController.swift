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
    
    
    
    @IBAction func aboutBtnPressed(sender: AnyObject) {
        performSegueWithIdentifier("AboutSegue", sender: self)
    }
    
    func addPageLetterSpacing(labels: [UILabel!]) {
        
        for label in labels {
            label.attributedText = NSAttributedString(string: label.text!.uppercaseString, attributes: [NSKernAttributeName: 5])
        }
        
    }

}
