//
//  Times.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 03/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import Foundation

class Meditation {
    
    static let instance = Meditation()
    
    let TIME_KEY = "times"
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var leadInTime: Int!
    var zazen1Time: Int!
    var kinhinTime: Int!
    var zazen2Time: Int!
    
    var objectType: Int!
    
    init() {
        if (userDefaults.objectForKey(TIME_KEY) == nil) {
            leadInTime = 1
            zazen1Time = 1
            kinhinTime = 10
            zazen2Time = 30
            
            setTimesToUserDefaults()
        } else {
            getTimesFromUserDefaults()
        }
    }
    
    private func setTimesToUserDefaults() {
        userDefaults.setInteger(leadInTime, forKey: "leadInTime")
        userDefaults.setInteger(zazen1Time, forKey: "zazen1Time")
        userDefaults.setInteger(kinhinTime, forKey: "kinhinTime")
        userDefaults.setInteger(zazen2Time, forKey: "zazen2Time")
        
        userDefaults.synchronize()
    }
    private func getTimesFromUserDefaults() {
        leadInTime = userDefaults.integerForKey("leadInTime")
        zazen1Time = userDefaults.integerForKey("zazen1Time")
        kinhinTime = userDefaults.integerForKey("kinhinTime")
        zazen2Time = userDefaults.integerForKey("zazen2Time")
    }
}