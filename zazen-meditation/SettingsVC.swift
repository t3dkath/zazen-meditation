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
        
        print(Meditation.instance.objectType)
        
        if Meditation.instance.objectType == objectType.ZAZEN.rawValue {
            kinhinLbl.alpha = ALPHA_VALUE
            kinhinTimeLbl.alpha = ALPHA_VALUE
            zazen2Lbl.alpha = ALPHA_VALUE
            zazen2TimeLbl.alpha = ALPHA_VALUE
        }

        let labels = [leadinLbl, leadinTimeLbl, zazen1Lbl, zazen1TimeLbl, kinhinLbl, kinhinTimeLbl, zazen2Lbl, zazen2TimeLbl]
        
        leadinTimeLbl.text = Meditation.instance.leadInTime.timeString
        zazen1TimeLbl.text = Meditation.instance.zazen1Time.timeString
        kinhinTimeLbl.text = Meditation.instance.kinhinTime.timeString
        zazen2TimeLbl.text = Meditation.instance.zazen2Time.timeString
        
        addPageLetterSpacing(labels)
    }
    
    @IBAction func onBeginPressed(sender: AnyObject) {
        performSegueWithIdentifier("ZazenSegue", sender: self)
    }
}
