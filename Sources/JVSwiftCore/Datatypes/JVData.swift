//
//  JVData.swift
//  
//
//  Created by Jan Verrept on 24/08/2021.
//

import Foundation

public extension Data{
	
	init(string:String){
		var stringAsBytes:[UInt8] = Array(string.utf8)
		self.init(bytes: &stringAsBytes, count: stringAsBytes.count)
	}
	
	init(bytes:[UInt8]){
		var numberOfBytes:[UInt8] = bytes
		self.init(bytes: &numberOfBytes, count: numberOfBytes.count)
	}
	
}

extension Data:CustomDescriptible {}

public extension CustomDescriptible where Self == Data{
	
	 var customDescription: String {
		if let stringRepresentation = String(data: self, encoding: .utf8) {
			return stringRepresentation
		} else {
			// Fallback to hex representation if unable to convert to UTF-8 string
			return "Hex representation: \(self.map { String(format: "%02hhx", $0) }.joined())"
		}
	}
}
