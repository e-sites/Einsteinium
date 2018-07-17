//
//  Optional.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 17/07/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import Foundation

extension Optional {
    public var optionalDescription: String {
        guard let `self` = self else {
            return "nil"
        }
        return String(describing: self)
    }
}
