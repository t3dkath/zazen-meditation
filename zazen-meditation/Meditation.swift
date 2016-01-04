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
    
    var leadinTime: Int!
    var zazen1Time: Int!
    var kinhinTime: Int!
    var zazen2Time: Int!
    
    var objectType: Int!
    var bellType: Int!
    
    var closingZendo = false
    
    init() {
        if !userDefaults.boolForKey("defaultsSaved") {
            leadinTime = 20
            zazen1Time = 20
            kinhinTime = 10
            zazen2Time = 30
            
            setTimesToUserDefaults()
        } else {
            getTimesFromUserDefaults()
        }
        
        bellType = userDefaults.integerForKey("Bell")
        saveBell()
    }
    
    private func setTimesToUserDefaults() {
        userDefaults.setBool(true, forKey: "defaultsSaved")
        userDefaults.setInteger(leadinTime, forKey: "leadinTime")
        userDefaults.setInteger(zazen1Time, forKey: "zazen1Time")
        userDefaults.setInteger(kinhinTime, forKey: "kinhinTime")
        userDefaults.setInteger(zazen2Time, forKey: "zazen2Time")
        
        userDefaults.synchronize()
    }
    private func getTimesFromUserDefaults() {
        leadinTime = userDefaults.integerForKey("leadinTime")
        zazen1Time = userDefaults.integerForKey("zazen1Time")
        kinhinTime = userDefaults.integerForKey("kinhinTime")
        zazen2Time = userDefaults.integerForKey("zazen2Time")
    }
    
    func saveTime(time: Int, key: String) {
        switch(key) {
            case "leadinTime": leadinTime = time
            case "zazen1Time": zazen1Time = time
            case "kinhinTime": kinhinTime = time
            default: zazen2Time = time
        }
        
        userDefaults.setInteger(time, forKey: key)
        userDefaults.synchronize()
    }
    
    func saveBell() {
        userDefaults.setInteger(bellType, forKey: "Bell")
        
        
    }
}