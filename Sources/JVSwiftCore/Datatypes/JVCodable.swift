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

// Provide a debugDescription for all Codable objects
// (creating an extension for 'CustomStringConvertible where Self:Codable' seems incopatible with existing implementations in JVNetworkingt)
public extension Encodable{

	/// Return a pretty-printed JSON string
	var debugDescription:String {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		guard let jsonData = try? encoder.encode(self), let prettyPrintedString = String(data: jsonData, encoding: .utf8) else {
			return "Error: Unable to create pretty-printed JSON string."
		}
		return prettyPrintedString
	}
	
}
