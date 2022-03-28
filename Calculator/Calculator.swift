//
//  Calculator.swift
//  Calculator
//
//  Created by user on 2022/3/27.
//

import Foundation

func pow(_ base: Int, _ exp: Int) -> Double {
    return pow(Double(base), Double(exp))
}

class Calculator: ObservableObject {
    
    @Published var displayValue:String = "0"
    
    var savedValue:Double?
    var inputValue:Double?
    var currentOp:Operator?
    var isEqualed:Bool = false
    let maxFigure:Int = 9
    var decimalPlace:Int = 0
    
    init() {
        reset()
    }
    
    func buttonPressed(_ label:String) {
        
        if label == "C" {
            reset()
            displayValue = "0"
        } else if label == "\u{00B1}" {
            posOrNegPressed()
        } else if label == "%" {
            persentagePressed()
        } else if label == "." {
            decimalPressed()
        } else if label == "=" {
            equalPressed()
        } else if let value = Double(label) {
            numberPressed(value)
        } else {
            operatorPressed(Operator(label))
        }
    }
    
    func reset() {
        savedValue = nil
        inputValue = nil
        currentOp = nil
        isEqualed = false
        decimalPlace = 0
    }
    
    func setDisplayValue(_ number: Double) {
        
        if abs(number) >= pow(10,maxFigure) {
            displayValue = "Error"
            reset()
            return
        }
        // Don't display a decimal if the number is an integer
        if number == floor(number) {
            displayValue = "\(Int(number))"
            
        // Otherwise, display the decimal
        } else {
            let decimalPlaces = maxFigure - checkFigure(number)
            displayValue = "\(round(pow(10, decimalPlaces)*number) / pow(10, decimalPlaces))"
        }
        
    }
    
    func checkFigure(_ value: Double) -> Int {
        var totalFigure = 1
        var checkValue = abs(Int(value))
        while checkValue/10 != 0 {
            checkValue = checkValue/10
            totalFigure += 1
        }
        return totalFigure
    }
    
    // MARK: Button Function
    
    // "+/-"
    func posOrNegPressed() {
        if isEqualed {
            savedValue = savedValue!*(-1)
            setDisplayValue(savedValue!)
        } else {
            
            if inputValue != nil {
                inputValue = inputValue!*(-1)
                setDisplayValue(inputValue!)
            }
        }

    }
    // "%"
    func persentagePressed() {
        if isEqualed {
            savedValue = savedValue!/100
            setDisplayValue(savedValue!)
        } else {
            
            if inputValue != nil {
                inputValue = inputValue!/100
                decimalPlace += 2
                setDisplayValue(inputValue!)
            }
        }
    }
    // "."
    func decimalPressed() {
        if isEqualed {
            reset()
            displayValue = "0."
            decimalPlace += 1
        } else {
            if inputValue == nil {
                inputValue = 0
            }
            if decimalPlace == 0 {
                decimalPlace += 1
                displayValue.append(contentsOf: ".")
            }
        }
    }
    // "="
    func equalPressed() {
        if isEqualed {
            savedValue = currentOp!.op(savedValue!,inputValue!)
            setDisplayValue(savedValue!)
        } else if currentOp != nil {
            if inputValue != nil || savedValue != nil {
                if currentOp!.isDivide && (inputValue == 0 || (savedValue == 0 && inputValue == nil)) {
                    displayValue = "Error"
                    reset()
                } else {
                    savedValue = currentOp!.op( savedValue ?? 0 , inputValue ?? savedValue!)
                    isEqualed = true
                    setDisplayValue(savedValue!)
                }
            }
        }
        
    }
    // Number 0~9
    func numberPressed(_ value:Double) {
        if isEqualed {
            reset()
            savedValue = value
            setDisplayValue(savedValue!)
        } else {
            if inputValue == nil || inputValue == 0 {
                if decimalPlace == 0 {
                    inputValue = value
                } else {
                    inputValue = value/pow(10,decimalPlace)
                    decimalPlace += 1
                }
                setDisplayValue(inputValue!)
            } else if checkFigure(inputValue!) < maxFigure {
                if decimalPlace == 0 {
                    inputValue = inputValue! * 10 + value
                } else {
                    inputValue = inputValue! + (value/pow(10,decimalPlace))
                    decimalPlace += 1
                }
                setDisplayValue(inputValue!)
            }
        }
 
    }
    // Operator
    func operatorPressed(_ op:Operator){
        
        if isEqualed {
            currentOp = nil
            inputValue = nil
            decimalPlace = 0
            isEqualed = false
        }
        
        if currentOp != nil && inputValue != nil {
            savedValue = currentOp!.op(( savedValue ?? 0 ), inputValue!)
            inputValue = nil
            decimalPlace = 0
            setDisplayValue(savedValue!)
        } else if currentOp == nil && inputValue != nil {
            savedValue = inputValue!
            inputValue = nil
            decimalPlace = 0
        }
        currentOp = op
        
    }
    
    
    
}
