//
//  UINibView.swift
//  Matchday-TV
//
//  Created by Bas van Kuijck on 25-07-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation
import UIKit

public protocol UINibView {
	static func instanceFromNib(name nibName: String?) -> Self
}

extension UINibView {
	public static func instanceFromNib(name nibName: String? = nil) -> Self {
        let nibName = nibName ?? String(describing: self)
        
        guard let nib = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first, nib is Self else {
            fatalError("Cannot find nib for '\(nibName)'")
        }
        return nib as! Self
	}
}
