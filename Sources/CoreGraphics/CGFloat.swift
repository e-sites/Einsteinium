//
//  CGFloat.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 26-11-15.
//  Copyright © 2015 E-sites. All rights reserved.
//

import Foundation
import CoreGraphics

public protocol CGFloatable {
    var cgFloatValue: CGFloat { get }
}

extension Int: CGFloatable {
    public var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
}

extension Double: CGFloatable {
    public var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
}

extension CGFloat: CGFloatable {
    public var cgFloatValue: CGFloat {
        return self
    }
}

extension CGFloatable {
    public func toRadians() -> CGFloat {
        return CGFloat.pi * cgFloatValue / 180.0
    }
    public func toDegrees() -> CGFloat {
        return 180.0 * cgFloatValue / CGFloat.pi
    }
}
