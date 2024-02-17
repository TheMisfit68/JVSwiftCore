//
//  JVCodable.swift
//
//
//  Created by Jan Verrept on 09/02/2024.
//

import Foundation

public extension Encodable {
	var description: String {
		do {
			let jsonData = try JSONEncoder().encode(self)
			let options: JSONSerialization.WritingOptions = [.prettyPrinted]
			let prettyPrintedData = try JSONSerialization.data(withJSONObject: try JSONSerialization.jsonObject(with: jsonData), options: options)
			
			if let jsonString = String(data: prettyPrintedData, encoding: .utf8) {
				return jsonString
			}
		} catch {
			return "Error encoding or pretty-printing \(type(of: self)): \(error)"
		}
		
		return "Failed to generate debug description"
	}
}
