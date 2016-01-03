//
//  ZazenVC.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class ZazenVC: ViewController {

    
    @IBOutlet weak var activityLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let labels = [activityLbl, timerLbl]
        
        addPageLetterSpacing(labels)
    }
    
    @IBAction func onCloseZendoPressed(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
