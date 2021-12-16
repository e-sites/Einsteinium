//
//  UIViewController.swift
//  Subway
//
//  Created by Bas van Kuijck on 07-03-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation
import UIKit
import Logging

extension UIViewController {
    public class var upmost: UIViewController? {
        var viewController = root
        while true {
            if let presentedViewController = viewController?.presentedViewController, presentedViewController.isBeingDismissed == false {
                viewController = presentedViewController
            } else {
                break
            }
            
        }
        return viewController
    }
    
    public class var root: UIViewController? {
        guard let window = UIApplication.shared.keyWindow else {
            logger.error("No keyWindow")
            return nil
        }
        
        guard let viewController = window.rootViewController else {
            logger.error("No rootViewController")
            return nil
        }
        
        return viewController
    }
}
