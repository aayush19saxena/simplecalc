//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    public func calculate(_ args: [String]) -> Int {
        return Int(calculateFloat(_args: args))
    }
    
    public func calculateFloat(_args: [String]) -> Float {
        if _args.count < 2 {
            return 0
        }
        let exp = _args[_args.count - 1]
        switch exp {
        case "count":
            return Float(_args.count - 1)
        case "avg":
            return computeAvg(args: _args)
        case "fact":
            return computeFact(args: _args)
        default:
            return compute(args: _args)
        }
    }
    
    public func compute(args: [String]) -> Float {
        let operation = args[1]
        guard let operand1 = Float(args[0]) else {
            return 0
        }
        
        guard let operand2 = Float(args[2]) else {
            return 0
        }
        
        switch operation {
        case "+":
            return operand1 + operand2
        case "-":
            return operand1 - operand2
        case "*":
            return operand1 * operand2
        case "/":
            return operand1 / operand2
        case "%":
            return abs(operand1).truncatingRemainder(dividingBy: abs(operand2))
        default:
            return 0
        }
        
    }
    
    public func computeAvg(args: [String]) -> Float {
        var total: Float = 0.0
        for i in 0..<args.count-1 {
            guard let num = Float(args[i]) else {
                return 0
            }
            total += num
        }
        return total / Float(args.count - 1)
    }
    
    public func computeFact(args: [String]) -> Float {
        var fact: Int = 1
        guard let num = Int(args[0]) else {
            return 1
        }
        
        if num < 2 {
            return Float(fact)
        }
        
        for i in 2...num {
            fact *= i
        }
        
        return Float(fact)
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

