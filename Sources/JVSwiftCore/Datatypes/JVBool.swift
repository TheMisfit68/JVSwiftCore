//
//  JVBool.swift
//
//  Created by Administrator on 14/09/14.
//  Copyright (c) 2014 OneClick. All rights reserved.
//

import Foundation

// MARK: - SET/RESET
public extension Bool {
	
	mutating func set(_ condition:Bool = true){
		if condition{
			self = true
		}
	}
	
	mutating func reset(_ condition:Bool = true){
		if condition{
			self = false
		}
	}
	
}

public func set(_ boolean:inout Bool){
	boolean.set()
}

public func reset(_ boolean:inout Bool){
	boolean.reset()
}


/**
 Swift Logical XOR operator (a.k.a. 'Bit controlled inverter')
 
 true  ^^ true   // false
 true  ^^ false  // true
 false ^^ true   // true
 false ^^ false  // false
 
 */

precedencegroup booleanOperatorPrecedence {
    associativity: left
}

infix operator ^^ : booleanOperatorPrecedence
public func ^^(left: Bool, right: Bool) -> Bool {
    return (left != right)
}


public extension String{
     var equalsTrue:Bool{
        return (
                lowercased() == "true" ||
                lowercased() == "yes" ||
                lowercased() == "on" ||
                lowercased() == "1"  )
    }
}

