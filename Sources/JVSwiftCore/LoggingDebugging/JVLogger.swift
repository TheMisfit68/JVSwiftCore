//
//  JVLogger.swift
//
//  Created by Jan Verrept on 3/12/14.
//  Copyright (c) 2014 OneClick. All rights reserved.
//

import Cocoa
import OSLog

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



