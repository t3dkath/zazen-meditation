//
//  AboutVC.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 03/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class AboutVC: ViewController {
    
    @IBOutlet weak var linkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeAboutBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func wwwLinkPressed(sender: AnyObject) {
        let wwwLink = "http://www.belfastzen.com"
        UIApplication.sharedApplication().openURL(NSURL(string: wwwLink)!)
    }
    
    @IBAction func donateBtnPressed(sender: AnyObject) {
        let donateLink = "http://www.belfastzen.com"
        UIApplication.sharedApplication().openURL(NSURL(string: donateLink)!)
    }

}
