//
//  JVRegularExpression.swift
//  JVCocoa
//
//  Created by Administrator on 8/10/14.
//  Copyright (c) 2014 OneClick. All rights reserved.
//

import RegexBuilder

infix operator =~ : ComparisonPrecedence
func =~(left: String, right:any RegexComponent) -> Bool {
    return left.contains(right)
}


extension RegexComponent{
    
    public static var emailAddress:any RegexComponent{
        return /\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b/
    }
    
    public static func tag(name:String) -> any RegexComponent{
       return "<\(name)[^>]*>(?<tagValue>.*?)</\(name)>"
    }
        
}



