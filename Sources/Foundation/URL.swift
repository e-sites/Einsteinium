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
            let parts = keyValueString.components(separatedBy: "=")
            guard parts.count == 2,
                let key = parts.first?.removingPercentEncoding,
                let value = parts.last?.removingPercentEncoding else {
                continue
            }
            
            var values: [String] = dictionary[key] ?? []
            values.append(value)
            dictionary[key] = values
        }
        
        return dictionary
    }
}
