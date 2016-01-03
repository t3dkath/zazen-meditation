//
//  SettingsVC.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class SettingsVC: ViewController {

    @IBOutlet weak var leadinLbl: UILabel!
    @IBOutlet weak var leadinTimeLbl: UILabel!
    @IBOutlet weak var zazen1Lbl: UILabel!
    @IBOutlet weak var zazen1TimeLbl: UILabel!
    @IBOutlet weak var kinhinLbl: UILabel!
    @IBOutlet weak var kinhinTimeLbl: UILabel!
    @IBOutlet weak var zazen2Lbl: UILabel!
    @IBOutlet weak var zazen2TimeLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let labels = [leadinLbl, leadinTimeLbl, zazen1Lbl, zazen1TimeLbl, kinhinLbl, kinhinTimeLbl, zazen2Lbl, zazen2TimeLbl]
        
        addPageLetterSpacing(labels)
    }
    
    @IBAction func onBeginPressed(sender: AnyObject) {
        performSegueWithIdentifier("ZazenSegue", sender: self)
    }
}
