//
//  JVStack.swift
//
//
//  Created by Jan Verrept on 25/08/2021.
//


typealias Stack = LIFO

public struct LIFO<T> {
		
	private var elements:[T]
	public var nextElement:T?{
		!elements.isEmpty ? elements.last : nil
	}
	public var isEmpty: Bool {
		 return elements.isEmpty
	}
	
	public init(){
		elements = []
	}

	
	// Variadic couple
	public mutating func push(_ newElements: T...){
		push(newElements)
	}
	public mutating func push(_ newElements:[T]){
		elements += newElements
	}
	
	mutating func pop()->T?{
		return !elements.isEmpty ? elements.removeLast() : nil
	}
    
}
