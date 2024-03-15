//
//  JVCodable.swift
//
//
//  Created by Jan Verrept on 09/02/2024.
//

import Foundation
// Dont extend Codable as a whole
// Instead extend Encodable or Decodable separately


// MARK: - REST-API Encoding/Decoding
// Such Data objects might e.g. be returned from a REST API request
public extension Decodable{

	init?(from data: Data, dateDecodingStrategy:JSONDecoder.DateDecodingStrategy = .deferredToDate) {
		let jsonDecoder = JSONDecoder()
		jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
		guard let decodedObject = try? jsonDecoder.decode(Self.self, from: data) else {return nil}
		self = decodedObject
	}
	
}


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

// MARK: - FileStorage
extension Encodable {
	
	func write(to fileName: String) throws {
		let encoder = JSONEncoder()
		let data = try encoder.encode(self)
		let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(fileName)
		try data.write(to: url)
	}
	
}

extension Decodable{
	
	static func read(from fileName: String) throws -> Self {
		let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(fileName)
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		return try decoder.decode(Self.self, from: data)
	}
	
}
