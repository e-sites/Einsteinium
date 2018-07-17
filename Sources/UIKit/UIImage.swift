//
//  UIImage.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 26-11-15.
//  Copyright © 2015 E-sites. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public func resize(width: CGFloat) -> UIImage? {
        let aspectRatio = self.size.width / self.size.height
        let size = CGSize(width: width, height: width / aspectRatio)
        return resize(size: size)
    }
    
    public func resize(height: CGFloat) -> UIImage? {
        let aspectRatio = self.size.width / self.size.height
        let size = CGSize(width: height * aspectRatio, height: height)
        return resize(size: size)
    }
    
    public func resize(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    public func crop(_ rect: CGRect) -> UIImage? {
        var rect = rect
        if scale > 1.0 {
            rect = CGRect(x: rect.origin.x * self.scale,
                          y: rect.origin.y * self.scale,
                          width: rect.size.width * self.scale,
                          height: rect.size.height * self.scale)
            
        }
        
        guard let cgimage = self.cgImage else {
            return nil
        }
        guard let imageRef = cgimage.cropping(to: rect) else {
            return nil
        }
        return UIImage(cgImage: imageRef, scale: scale, orientation: imageOrientation)
    }
    
}
