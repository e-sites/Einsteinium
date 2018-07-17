//
//  NSURL.swift
//  Hardlopen
//
//  Created by Bas van Kuijck on 27-01-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation

extension URL {
    public var queryDictionary: [String: [String]]? {
        guard let query = self.query else {
            return nil
        }
        var dictionary: [String: [String]] = [:]
        
        let array = query.components(separatedBy: "&")
        
        for keyValueString in array {
            var parts = keyValueString.components(separatedBy: "=")
            if parts.count < 2 {
                continue
            }
            
            let key = parts[0].removingPercentEncoding!
            let value = parts[1].removingPercentEncoding!
            
            var values = dictionary[key] ?? [String]()
            values.append(value)
            dictionary[key] = values
        }
        
        return dictionary
    }
}
