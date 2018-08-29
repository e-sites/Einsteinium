//
//  UIButton.swift
//  Einsteinium
//
//  Created by Hindrik on 29/08/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import Foundation
import UIKit

private let minimalHitArea = CGSize(width: 44.0, height: 44.0)

extension UIButton {
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // return if button cannot have a hit-area
        if isHidden || false == isUserInteractionEnabled || alpha < 0.01 { return nil }

        let buttonSize = bounds.size
        let widthToAdd = max(minimalHitArea.width - buttonSize.width, 0)
        let heightToAdd = max(minimalHitArea.height - buttonSize.height, 0)
        let enlargedHitArea = bounds.insetBy(dx: -widthToAdd / 2, dy: -heightToAdd / 2)

        // perform hit test
        return (enlargedHitArea.contains(point)) ? self : nil
    }
}
