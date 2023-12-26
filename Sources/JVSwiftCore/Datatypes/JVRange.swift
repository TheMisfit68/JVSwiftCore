//
//  JVRange.swift
//  
//
//  Created by Jan Verrept on 21/02/2021.
//

import Foundation

public extension Comparable{
	
	func copyLimitedBetween(_ range: ClosedRange<Self>)->Self{
		var copiedValue:Self = self
		copiedValue.limitBetween(range)
		return copiedValue
	}
	
	mutating func limitBetween(_ range: ClosedRange<Self>){
		self = min(max(self, range.lowerBound), range.upperBound)
	}
	
}

public func rescale(value: Int, inputRange: ClosedRange<Int>, outputRange: ClosedRange<Int>)->Int{
	let limitedValue:Int = value.copyLimitedBetween(inputRange)
	let inputScale = inputRange.upperBound-inputRange.lowerBound
	let outputScale:Float = Float(outputRange.upperBound-outputRange.lowerBound)
	let perecentage:Float = Float(limitedValue-inputRange.lowerBound)/Float(inputScale)
	let rescaledValue:Int = outputRange.lowerBound+Int(perecentage*outputScale)
	return rescaledValue
}
