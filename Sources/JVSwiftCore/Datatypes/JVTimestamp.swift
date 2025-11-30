//
//  JVTimestamp.swift
//
//
//  Created by Jan Verrept on 31/01/2021.
//

import Foundation

public typealias Timestamp = TimeInterval

public extension TimeInterval {
	
	static var currentTimestamp:Timestamp {
		let now = Date()
		return (now.timeIntervalSince1970 * 1000.0)
	}

}
