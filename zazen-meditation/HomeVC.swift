//
//  ViewController.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class HomeVC: ViewController {
    
    @IBOutlet weak var zbtnZazen1Lbl: UILabel!
    @IBOutlet weak var zbtnZazen1TimeLbl: UILabel!
    
    @IBOutlet weak var kbtnZazen2Lbl: UILabel!
    @IBOutlet weak var kbtnZazen2TimeLbl: UILabel!
    @IBOutlet weak var kbtnKinhinLbl: UILabel!
    @IBOutlet weak var kbtnKinhinTimeLbl: UILabel!
    @IBOutlet weak var kbtnZazen3Lbl: UILabel!
    @IBOutlet weak var kbtnZazen3TimeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        setupBells()
    }
    
    override func viewDidAppear(animated: Bool) {
        if Meditation.instance.closingZendo {
            bells2.play()
            Meditation.instance.closingZendo = false
        }
        zbtnZazen1TimeLbl.text = Meditation.instance.zazen1Time.timeString
        kbtnZazen2TimeLbl.text = Meditation.instance.zazen1Time.timeString
        kbtnKinhinTimeLbl.text = Meditation.instance.kinhinTime.timeString
        kbtnZazen3TimeLbl.text = Meditation.instance.zazen2Time.timeString
        
        let labels = [zbtnZazen1Lbl, zbtnZazen1TimeLbl, kbtnZazen2Lbl, kbtnZazen2TimeLbl, kbtnKinhinLbl, kbtnKinhinTimeLbl, kbtnZazen3Lbl, kbtnZazen3TimeLbl]
        addPageLetterSpacing(labels)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

