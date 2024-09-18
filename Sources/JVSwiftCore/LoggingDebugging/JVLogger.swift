//
//  JVLogger.swift
//
//  Created by Jan Verrept on 3/12/14.
//  Copyright (c) 2014 OneClick. All rights reserved.
//

import Cocoa
import OSLog

/// A protocol for types that can log messages.
public protocol Loggable {
	static var logger: Logger { get }
}

/// Protocol extension to provide a default logger for all types that conform to `Loggable`.
public extension Loggable {
	
	/// A default logger that automatically gets the subsystem and category set.
	static var logger: Logger {
		let moduleName = String(reflecting: Self.self)
		let className = String(describing: Self.self)
		let subsystem = moduleName.components(separatedBy: ".").dropLast().joined(separator: ".")
		return Logger(subsystem: subsystem, category: className)
	}
}

extension Logger{
    
    public enum Category:String{
        case lifeCycle
    }
    
    public init(subsystem:String, category:Category){
        self.init(subsystem: subsystem, category: category.rawValue)
    }
        
    public func printThisMethod<T:Any>(
        type:T,
        _ function: String = #function,
        _ file: String = #file,
        _ line: Int = #line){
            
#if DEBUG
            
            // Clear any unresolved expressions from the variables received from the callers side
            let functionString:String
            if function.containsSubstring("expr") || function == ""{
                functionString = ""
            }else{
                functionString = ".\(function) "
            }
            
            let fileString:String
            if file.containsSubstring("expr") || file == ""{
                fileString = " "
            }else{
                fileString = "\(file) "
            }
            
            // Just print to stio instead fo log for temp debuggging
            print("{}\t\(functionString)(\(fileString)line \(line) :")
            let typeDescription = String(describing: type)
            print("{}\t\(typeDescription)")
            
#endif
            
        }

    
}



