//
//  JVQueue.swift
//  
//
//  Created by Jan Verrept on 25/08/2021.
//

import Foundation

public typealias Queue = FIFO

public struct FIFO<T> {
	
	private var elements:[T]
	public var nextElement:T?{
		!elements.isEmpty ? elements.first : nil
	}
	public var isEmpty: Bool {
		return elements.isEmpty
	}
	
	public init(){
		elements = []
	}
	
	
	// Variadic couple
	public mutating func enqueue(_ newElements: T...){
		self.enqueue(newElements)
	}
	public mutating func enqueue(_ newElements:[T]){
		self.elements += newElements
	}
	
	public mutating func dequeue()->T?{
		return !elements.isEmpty ? elements.removeFirst() : nil
	}
	
}
