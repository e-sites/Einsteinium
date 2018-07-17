//
//  Array.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 26-11-15.
//  Copyright © 2015 E-sites. All rights reserved.
//

import Foundation

extension Array {
    public var debugDescription: String {
        let plural = count == 1 ? "" : "s"
        var resultString = ""
        for (index, element) in enumerated() {
            resultString = "\(resultString)\n  ▿ [\(index)] : \(element)"
        }
        let typeString = "\(type(of: self))"
        return "\n▿ <\(typeString)> \(count) element\(plural)\(resultString)\n"
    }
    
    public mutating func shuffle() {
        if count < 2 { return }
        for index in 0..<(count - 1) {
            let newIndex = Int(arc4random_uniform(UInt32(count - index))) + index
            swapAt(index, newIndex)
        }
	}
	
	public var randomItem: Element? {
        if isEmpty {
			return nil
        }
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
		return self[randomIndex]
	}
}

extension Array where Element: Hashable {
    public var unique: [Element] {
        var tmpArray: [Element] = []
        for index in 0..<count {
            if !tmpArray.contains(self[index]) {
                tmpArray.append(self[index])
            }
        }
        
        return tmpArray
    }

    public func exclusive(with array: [Element]) -> [Element] {
        var returnArray: [Element] = []
        for element in self {
            if array.contains(element) {
                returnArray.append(element)
            }
        }
        return returnArray
    }
    
    mutating public func exclusiveIn(with array: [Element]) {
        for element in self {
            if !array.contains(element) {
                remove(object: element)
            }
        }
    }
}

extension Array {
    public func limit(at limit: Int) -> [Element] {
		if count <= limit {
			return self
		}
		return Array(self[0..<limit])
	}
}

public protocol Summable {
    init()
    static func + (lhs: Self, rhs: Self) -> Self
}

extension Int: Summable {}
extension Int8: Summable {}
extension Int16: Summable {}
extension Int32: Summable {}
extension Int64: Summable {}
extension UInt: Summable {}
extension UInt8: Summable {}
extension UInt16: Summable {}
extension UInt32: Summable {}
extension UInt64: Summable {}
extension Double: Summable {}
extension Float: Summable {}

extension Array where Element: Summable {
	public func sum() -> Element {
        return reduce(Element(), +)
    }
}

extension Array where Element: Equatable {
    public mutating func remove(object: Element) {
        self = filter { $0 != object }
    }
}
