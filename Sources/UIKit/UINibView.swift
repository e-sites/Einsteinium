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
	public static func instanceFromNib(name nibName: String? = nil) -> Self? {
		let nibName = nibName ?? "\(self)"
		return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Self
	}
}
