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
	
	public var isEmpty: Bool {
		return elements.isEmpty
	}
	public var count: Int {
		return elements.count
	}
	public init(){
		elements = []
	}
	
	// MARK: - Enqueue elements
	// Add elements to the end of the Queue
	public mutating func enqueue(_ newElements: T...){
		self.enqueue(newElements)
	}
	// Variadic version
	public mutating func enqueue(_ newElements:[T]){
		self.elements += newElements
	}
	
	// Make an element skip the Queue and become the first element (again)
	public mutating func requeue(_ newElement:T){
		self.elements.insert(newElement, at: 0)
	}
	public mutating func skipped(by newElement:T){
		self.requeue(newElement)
	}
	
	
	// MARK: - Dequeue elements
	// Take the next element form the Queue
	public mutating func dequeue()->T?{
		return !elements.isEmpty ? elements.removeFirst() : nil
	}
	
	public mutating func clear(){
		self.elements = []
	}

	
	// MARK: - Two step dequeue
	public var nextElement:T?{
		!elements.isEmpty ? elements.first : nil
	}
	public mutating func removeElement(){
		if !elements.isEmpty{
			elements.removeFirst()
		}
	}
	
}
