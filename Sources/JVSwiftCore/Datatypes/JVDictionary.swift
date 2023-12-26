//
//  JVDictionary.swift
//  File
//
//  Created by Jan Verrept on 17/09/2021.
//

import Foundation

// MARK: - KeyPath Support
public extension Dictionary {
	
	typealias KeyPath = [Key]
	
	// MARK: - Helper function
	
	// Convert String into an Array of Keys (= an Array of Hashables)
	private static func keyPath(_ keyPathString:String)->KeyPath?{
		let keyPathComponents:[String] = keyPathString.components(separatedBy: ".")
		let keyPath = keyPathComponents.compactMap{ $0 as? Key }
		guard (keyPath.count == keyPathComponents.count) else { return nil }
		return keyPath
	}
	
	// MARK: - KeyPath Getters
	
	// String version
	func value(forKeyPath keyPathString:String) -> Any? {
		
		if let keyPath =  Dictionary.keyPath(keyPathString){
			return value(forKeyPath: keyPath)
		}else{
			return nil
		}
		
	}
	
	// Variadic-Key version
	func value(forKeyPath keyPath:Key...) -> Any? {
		return value(forKeyPath: keyPath)
	}
	
	// Main version
	func value(forKeyPath keyPath:KeyPath) -> Any? {
		
		let currentKey = keyPath.first
		
		switch keyPath.count {
			case 2...:
				// Use recursion to get values from children
				guard let currentDictionary = self[currentKey!] as? [Key: Value] else {return nil}
				let remainingKeyPath = Array( keyPath.dropFirst() )
				return currentDictionary.value(forKeyPath: remainingKeyPath)
			case 1:
				// end-recursion reached
				let mostInnerValue = self[currentKey!]
				return mostInnerValue
			default:
				return nil;
		}
		
	}
	
	
	// MARK: - KeyPath Setters
	
	// String version
	mutating func setValue(_ value:Any, forKeyPath keyPathString:String){
		if let keyPath = Dictionary.keyPath(keyPathString){
			setValue(value, forKeyPath:keyPath)
		}
	}
	
	// Variadic-Key version
	mutating func setValue(_ value:Any, forKeyPath keyPath:Key...){
		setValue(value, forKeyPath: keyPath)
	}
	
	// Main version
	mutating func setValue(_ value: Any, forKeyPath keyPath:KeyPath){
		
		let currentKey = keyPath.first
		
		switch keyPath.count {
			case 2...:
				// If currentDictionary doens't exists yet then
				// create a new Key:Value-pair for it
				if self[currentKey!] as? [Key:Value] == nil, let newValue = [:] as [Key:Value] as? Value {
					self[currentKey!] = newValue
				}
				
				// Use recursion to pass the values onto the children
				guard var currentDictionary = self[currentKey!] as? [Key: Value] else {return}
				let remainingKeyPath = Array( keyPath.dropFirst() )
				currentDictionary.setValue(value, forKeyPath: remainingKeyPath)
				if let newValue = currentDictionary as? Value{
					self[currentKey!] = newValue
				}
			case 1:
				// end-recursion reached
				self[currentKey!] = value as? Value
			default:
				return;
		}
	}
	
	
	
	// MARK: - Subscripts
	subscript(keyPath keyPath: Dictionary.KeyPath) -> Any? {
		
		get {
			return value(forKeyPath: keyPath)
		}
		
		set {
			if let newValue = newValue{
				setValue(newValue, forKeyPath: keyPath)
			}
		}
		
	}
	
	subscript(keyPath keyPathString: String) -> Any? {
		
		get {
			return value(forKeyPath: keyPathString)
		}
		
		set {
			if let newValue = newValue{
				setValue(newValue, forKeyPath: keyPathString)
			}
		}
		
	}
	
}






