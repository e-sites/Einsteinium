//
//  UIViewController.swift
//  Subway
//
//  Created by Bas van Kuijck on 07-03-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public class var upmost: UIViewController {
        var viewController = root
        while true {
            if let pres = viewController.presentedViewController, pres.isBeingDismissed == false {
                viewController = pres
            } else {
                break
            }
            
        }
        return viewController
    }
    
    public class var root: UIViewController {
        guard let window = UIApplication.shared.keyWindow else {
            preconditionFailure("No keyWindow")
        }
        
        guard let viewController = window.rootViewController else {
            preconditionFailure("No rootViewController")
        }
        return viewController
    }
}
