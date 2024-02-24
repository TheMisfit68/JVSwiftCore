
//
//  JVCustomDescriptible.swift
//
//
//  Created by Jan Verrept on 20/02/2024.
//

import Foundation

public protocol CustomDescriptible {
	var customDescription: String { get }
	
	var stringValue:String? {get}
}
