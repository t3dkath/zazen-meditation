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
        
        let labels = [zbtnZazen1Lbl, zbtnZazen1TimeLbl, kbtnZazen2Lbl, kbtnZazen2TimeLbl, kbtnKinhinLbl, kbtnKinhinTimeLbl, kbtnZazen3Lbl, kbtnZazen3TimeLbl]
        
        addPageLetterSpacing(labels)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func zazenSettings(sender: AnyObject) {
        performSegueWithIdentifier("OptionsSegue", sender: self)
    }
    @IBAction func kinhinSettings(sender: AnyObject) {
        performSegueWithIdentifier("OptionsSegue", sender: self)
    }
    
    


}

