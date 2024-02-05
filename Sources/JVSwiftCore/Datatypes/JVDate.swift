//
//  JVDate.swift
//
//
//  Created by Jan Verrept on 30/10/2023.
//

import Foundation

public extension Date {
	
	var utcToLocal: Date {
		let secondsFromUTC = Double(Calendar.current.timeZone.secondsFromGMT(for: self))
		return self+secondsFromUTC
	}
	
	var noon: Date {
		return Calendar.current.startOfDay(for: self)+(12*3600)
	}
	
	// MARK: - String representations
	func localDateTimeString() -> String {
		let formatter = DateFormatter()
		formatter.dateStyle = .short
		formatter.timeStyle = .medium
		formatter.locale = Locale.current // Adjusts the format to the user's current locale
		return formatter.string(from: self)
	}
	
}
