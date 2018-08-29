//
//  Collection.swift
//  Einsteinium
//
//  Created by Hindrik on 29/08/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import Foundation

extension Collection {
    /// Returns the element at the index or nil
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
