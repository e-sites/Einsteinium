//
//  UITextField.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 26-11-15.
//  Copyright © 2015 E-sites. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    public func selectTextRange(_ range: Range<Int>) {
        selectTextRange(range: NSRange(location: range.lowerBound, length: range.count))
    }
    
    public func selectTextRange(range: NSRange) {
        guard let text = self.text else {
            return
        }
        
        if range.length == 0
            || range.location >= text.count
            || range.location + range.length > text.count {
            return
        }

        guard let begin = position(from: beginningOfDocument, offset: range.location) else {
            return
        }
                
        guard let end = position(from: begin, offset: range.length) else {
            return
        }
        
        selectedTextRange = textRange(from: begin, to: end)
    }
}
