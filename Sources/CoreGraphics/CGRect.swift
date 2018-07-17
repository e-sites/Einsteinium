//
//  CGRect.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 26-11-15.
//  Copyright © 2015 E-sites. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGRect {
	public var mid: CGPoint {
		return CGPoint(x: midX, y: midY)
	}
}
