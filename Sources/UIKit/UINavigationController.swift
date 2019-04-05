//
//  UINavigationController.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 14-01-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    public func removeViewController(viewController: UIViewController, animated: Bool) {
        setViewControllers(viewControllers.filter { $0 != viewController }, animated: animated)
    }
    
    public func popViewController(from viewController: UIViewController, animated: Bool) {
        defer {
            popViewController(animated: animated)
        }
        guard let index = viewControllers.firstIndex(of: viewController), index > 0 else {
            return
        }

        setViewControllers(Array(viewControllers[0...index]), animated: false)
    }
}
