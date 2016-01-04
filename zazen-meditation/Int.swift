//
//  Int.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 03/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

extension Int {
    
    var timeString: String {
        var minString: String
        
        if self == 1 {
            minString = "Minute"
        } else {
            minString = "Minutes"
        }
        
        return "\(self) \(minString)"
    }
    
    var inSeconds: Int {
        return self * 59
    }
    var inSecondsDisplay: String {
        var secString: String
        
        if self == 1 {
            secString = "Second"
        } else {
            secString = "Seconds"
        }
        
        return "\(self) \(secString)"
    }
    
    var inMinutes: String {
        return ((self / 60) + 1).timeString
    }
    
}