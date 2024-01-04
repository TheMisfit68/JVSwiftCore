//
//  JVDate.swift
//
//
//  Created by Jan Verrept on 30/10/2023.
//

import Foundation

public extension Date {
    
    var utcToLocal: Date {
        let secondsFromUTC = Double(Calendar.current.timeZone.secondsFromGMT(for: self))
        return self+secondsFromUTC
    }
    
    var noon: Date {
        return Calendar.current.startOfDay(for: self)+(12*3600)
    }
    
  
}
