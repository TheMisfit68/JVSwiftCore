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
