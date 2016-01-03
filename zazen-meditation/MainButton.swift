//
//  MainButton.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 03/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class MainButton: UIButton {

    override func awakeFromNib() {
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 4
    }

}
