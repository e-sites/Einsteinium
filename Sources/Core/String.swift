//
//  String.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 26-11-15.
//  Copyright © 2015 E-sites. All rights reserved.
//

import Foundation

/**
 Repeats a String
 
 let rep = "abc" * 5 // "abcabcabcabcabc"
 
 - parameter string:      String
 - parameter repeatCount: Int
 
 - returns: String
 */
public func * (string: String, repeatCount: Int) -> String {
    var str = ""
    for _ in 0..<repeatCount {
        str = "\(str)\(string)"
    }
    return str
}

infix operator =~

/**
 Regular expression match
 
 let match = ("ABC123" =~ "[A-Z]{3}[0-9]{3}") // true
 */
public func =~ (string: String, regex: String) -> Bool {
    return string.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
}

extension String {
    public func truncate(length: Int, trailing: String = "") -> String {
        return count > length ? prefix(length - trailing.count) + trailing : self
    }

    public func capturedGroups(withRegex pattern: String) -> [String] {
        var results: [String] = []

        let regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [])
        } catch {
            return results
        }

        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: count))

        guard let match = matches.first else { return results }

        let lastRangeIndex = match.numberOfRanges - 1
        guard lastRangeIndex >= 1 else { return results }

        for index in 1...lastRangeIndex {
            let capturedGroupIndex = match.range(at: index)
            let matchedString = (self as NSString).substring(with: capturedGroupIndex)
            results.append(matchedString)
        }

        return results
    }
}

extension String {
   public subscript(integerIndex: Int) -> Character {
        return self[index(startIndex, offsetBy: integerIndex)]
    }
    
	public subscript(integerRange: Range<Int>) -> String {
		let start = index(startIndex, offsetBy: integerRange.lowerBound)
        let end = index(startIndex, offsetBy: integerRange.upperBound)
		let range = start..<end
        return String(self[range])
    }
	
    /**
     Escaped string to prevent injection
     
     Use this for user generated content
     */
	public var escapedString: String {
        return replacingOccurrences(of: "%", with: "%%")
    }
    
    /**
     Unscaped string to prevent injection
     
     Use this for user generated content
     */
	public var unescapedString: String {
        return replacingOccurrences(of: "%%", with: "%")
    }
    
	public func ucFirst() -> String {
		if self == "" {
			return ""
		}
        return replacingCharacters(in: startIndex..<index(startIndex, offsetBy: 1),
                                   with: String(self[startIndex]).uppercased())
        
    }
    
	public func trim() -> String {
        return trimmingCharacters(in: .whitespaces)
        
    }
}
