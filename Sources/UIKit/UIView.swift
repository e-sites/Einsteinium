//
//  UIView.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 26-11-15.
//  Copyright © 2015 E-sites. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     Gets ths absolute position of this instance
     Absolute position is the position of the element on the screen
     */
    public var absoluteFrame: CGRect {
        return absoluteFrame(relativeTo: nil)
    }

    public func absoluteFrame(relativeTo relativeView: UIView? = nil) -> CGRect {
        var frame = bounds
        var parent = self
        while true {
            guard let superview = parent.superview else {
                break
            }
            if let scrollView = parent as? UIScrollView {
                frame.origin.x -= scrollView.contentOffset.x
                frame.origin.y -= scrollView.contentOffset.y
            }
            frame.origin.x += parent.frame.origin.x
            frame.origin.y += parent.frame.origin.y
            parent = superview
        }

        if let relativeView = relativeView {
            let relativeFrame = relativeView.absoluteFrame
            frame.origin.y -= relativeFrame.origin.y
        }

        return frame
    }
    
    public func shake(offset: CGFloat, completed: @escaping () -> Void) {
        transform = CGAffineTransform(translationX: offset, y: 0)
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut,
                       animations: {
            self.transform = CGAffineTransform.identity
        }, completion: { _ in
            completed()
        })
    }
    
    public func captureImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        layer.render(in: context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public var closestViewController: UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            if let responder = responder as? UIViewController {
                return responder
            }
            responder = responder?.next
            
        }
        return nil
    }
}
