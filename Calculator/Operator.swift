//
//  Operator.swift
//  Calculator
//
//  Created by user on 2022/3/27.
//

import Foundation

class Operator {
    
    var op: (Double,Double) -> Double
    var isDivide: Bool = false
    
    init(_ string:String) {
        if string == "+" {
            self.op = (+)
            
        } else if string == "-" {
            self.op = (-)
            
        } else if string == "\u{00D7}" {
            self.op = (*)
            
        } else {
            self.op = (/)
            self.isDivide = true
        }
    }
    
}
