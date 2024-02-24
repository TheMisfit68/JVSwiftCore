//
//  JVCodable.swift
//
//
//  Created by Jan Verrept on 09/02/2024.
//

import Foundation

// Make it possible to Create/Decode a Decodable object from a Data object
// Such Data objects might e.g. be returned from a REST API request
public extension Decodable{

	init?(from data: Data, dateDecodingStrategy:JSONDecoder.DateDecodingStrategy = .deferredToDate) {
		let jsonDecoder = JSONDecoder()
		jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
		guard let decodedObject = try? jsonDecoder.decode(Self.self, from: data) else {return nil}
		self = decodedObject
	}
	
}


// Dont extend Codable as a whole
// Instead extend Encodable
public extension Encodable {

	/// Return a pretty-printed JSON string to represent the conforming (En)Codable
	var customDescription:String {
		return self.stringValue ?? ""
	}
	
	var stringValue:String?{
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		let jsonData = try? encoder.encode(self)
		guard jsonData != nil else { return nil }
		let prettyPrintedString = String(data: jsonData!, encoding: .utf8)
		return prettyPrintedString
	}
	
}
